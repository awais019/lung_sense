import 'dart:io';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String result;
  final File image;

  const Result({super.key, required this.result, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text("Result",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 16.0),
            Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ]),
                child: Image.file(
                  image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.fitWidth,
                )),
            const SizedBox(height: 16.0),
            Text(result,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
