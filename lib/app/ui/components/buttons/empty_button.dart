import 'package:flutter/cupertino.dart';

class EmptyButton extends StatelessWidget {
  const EmptyButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: child,
    );
  }
}
