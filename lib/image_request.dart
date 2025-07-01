import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lung_sense/analyze.service.dart';
import 'package:lung_sense/result.dart';

class ImageRequest extends StatefulWidget {
  const ImageRequest({super.key});

  @override
  State<ImageRequest> createState() => _ImageRequestState();
}

class _ImageRequestState extends State<ImageRequest> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        StreamedResponse response = await Analyze.analyzeImage(image.path);
        if (response.statusCode == 200) {
          Map<String, dynamic> data =
              jsonDecode(await response.stream.bytesToString())
                  as Map<String, dynamic>;
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Result(
                      prediction: data['prediction'],
                      riskLevel: data['risk_level'] ?? 'Unknown',
                      nextScan: data['next_scan'] ?? '-',
                      lastScanDate: data['last_scan_date'] ?? '-',
                      reportUrl: data['report_url'],
                      image: image,
                    ),
              ),
            );
          }
        } else {
          debugPrint(response.reasonPhrase);
        }
      } else {}
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> _takePicture() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        StreamedResponse response = await Analyze.analyzeImage(image.path);
        if (response.statusCode == 200) {
          Map<String, dynamic> data =
              jsonDecode(await response.stream.bytesToString())
                  as Map<String, dynamic>;
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Result(
                      prediction: data['prediction'],
                      riskLevel: data['risk_level'] ?? 'Unknown',
                      nextScan: data['next_scan'] ?? '-',
                      lastScanDate: data['last_scan_date'] ?? '-',
                      reportUrl: data['report_url'],
                      image: image,
                    ),
              ),
            );
          }
        } else {
          debugPrint(response.reasonPhrase);
        }
      } else {}
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Image.asset("assets/logo-short.png"),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: TextButton(
                onPressed: () => _takePicture(),
                child: const Text(
                  "Take picture",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: TextButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text(
                  "Select an image",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
