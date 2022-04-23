import 'package:flutter/material.dart';

void main() => runApp(const OvesDuApp());

class OvesDuApp extends StatelessWidget {
  const OvesDuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'OvesDu Application',
      home: Scaffold(
        body: Center(
          child: Text('OvesDu'),
        ),
      ),
    );
  }
}
