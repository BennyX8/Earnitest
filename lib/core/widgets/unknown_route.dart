import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({super.key});

  @override
  State<UnknownPage> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Page')),
      body: const Center(
        child: Text(
          'Missed your way or Page is not in use',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
