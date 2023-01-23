import 'package:flutter/material.dart';

class CustomFlex extends StatelessWidget {
  const CustomFlex({
    Key? key,
    required this.flex,
  }) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: const SizedBox.shrink(),
    );
  }
}
