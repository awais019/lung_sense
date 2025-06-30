import 'package:flutter/material.dart';
import 'package:lung_sense/on_board.dart';
import 'package:lung_sense/user_store.dart';

class BaseUrlScreen extends StatefulWidget {
  const BaseUrlScreen({super.key});

  @override
  State<BaseUrlScreen> createState() => _BaseUrlScreenState();
}

class _BaseUrlScreenState extends State<BaseUrlScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller.text = UserStore().baseUrl ?? '';
  }

  Future<void> _saveUrl() async {
    final url = _controller.text.trim();
    final uri = Uri.tryParse(url);
    if (url.isEmpty || uri == null || !uri.hasScheme || !uri.hasAuthority) {
      setState(() => _error = 'Please enter a valid URL');
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    await UserStore().saveBaseUrl(url);
    if (mounted) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const OnBoard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set Backend URL')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Backend Base URL',
                errorText: _error,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
              enabled: !_saving,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _saveUrl,
                child:
                    _saving
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
