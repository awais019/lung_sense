import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lung_sense/user_store.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<dynamic> _history = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final url = Uri.parse('${UserStore().baseUrl}/history');
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${_getToken()}'},
      );
      if (response.statusCode == 200) {
        setState(() {
          _history = json.decode(response.body)['history'];
        });
      } else {
        setState(() {
          _error = 'Failed to load history.';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _getToken() {
    return UserStore().token ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
              ? Center(child: Text(_error!))
              : ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  final item = _history[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      title: Text(item['prediction'] ?? 'No prediction'),
                      subtitle: Text(item['created_at'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.picture_as_pdf),
                        onPressed: () async {
                          final url = item['report_url'];
                          if (url != null && url.isNotEmpty) {
                            final fullUrl =
                                url.startsWith('http')
                                    ? url
                                    : "${UserStore().baseUrl}/$url";
                            if (await canLaunchUrl(Uri.parse(fullUrl))) {
                              await launchUrl(
                                Uri.parse(fullUrl),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
