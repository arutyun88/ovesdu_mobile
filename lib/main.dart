import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/widgets/logo_widget.dart';

void main() => runApp(const OvesDuApp());

class OvesDuApp extends StatelessWidget {
  const OvesDuApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize = 96.0;
    return const MaterialApp(
      title: 'OvesDu Application',
      home: Scaffold(
        body: Center(
          child: LogoWidget(fontSize: fontSize),
        ),
      ),
    );
  }
}
