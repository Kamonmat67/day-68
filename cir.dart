import 'package:flutter/material.dart';
import 'dart:math';

class CirclePage extends StatefulWidget {
  const CirclePage({super.key});

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final TextEditingController _radiusCtrl = TextEditingController();

  double? _result;

  void _calculate() {
    final r = double.tryParse(_radiusCtrl.text);

    if (r != null) {
      setState(() {
        _result = pi * r * r;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circle Area')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _radiusCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Radius',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),

            const SizedBox(height: 20),

            if (_result != null)
              Text(
                'Area = $_result',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
