import 'package:flutter/material.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({super.key});

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  final TextEditingController _baseCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController();

  double? _result;

  void _calculate() {
    final base = double.tryParse(_baseCtrl.text);
    final height = double.tryParse(_heightCtrl.text);

    if (base != null && height != null) {
      setState(() {
        _result = 0.5 * base * height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Triangle Area')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _baseCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Base',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: _heightCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height',
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
