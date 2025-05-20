import 'dart:io';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final File image;

  const Result({super.key, required this.result, required this.image});

  @override
  Widget build(BuildContext context) {
    // class 0: adenocarcinoma left lower lobe
    // class 1: large cell carcinoma
    // class 2: normal
    // class 3: squamous cell carcinoma

    final anaylsis =
        result == 0
            ? "Adenocarcinoma left lower lobe"
            : result == 1
            ? "Large cell carcinoma"
            : result == 2
            ? "Normal"
            : result == 3
            ? "Squamous cell carcinoma"
            : "Unknown";

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              "Result",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.file(
                image,
                height: 200,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              anaylsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
