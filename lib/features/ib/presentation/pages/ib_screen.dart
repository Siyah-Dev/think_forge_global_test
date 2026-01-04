import 'package:flutter/material.dart';

class IBScreen extends StatelessWidget {
  const IBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IB'),
      ),
      body: const Center(
        child: Text('IB Screen'),
      ),
    );
  }
}

