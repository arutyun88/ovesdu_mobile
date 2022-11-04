import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class NotificationSnackBar extends StatefulWidget {
  const NotificationSnackBar({
    Key? key,
    required ValueNotifier<List> notifications,
  })  : _notifications = notifications,
        super(key: key);

  final ValueNotifier<List> _notifications;

  @override
  State<NotificationSnackBar> createState() => _NotificationSnackBarState();
}

class _NotificationSnackBarState extends State<NotificationSnackBar>
    with TickerProviderStateMixin {
  late AnimationController _positionAnimationController;
  late Animation<double> _positionAnimation;
  late Tween<double> _tween;
  late List _changedList;

  @override
  void initState() {
    super.initState();

    _positionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _tween = Tween<double>(
      begin: -150.0,
      end: 0.0,
    );
    _positionAnimation = _tween.animate(_positionAnimationController)
      ..addListener(_containsListener);
    widget._notifications.addListener(_containsListener);

    _changedList = widget._notifications.value.map((e) => e).toList();
  }

  @override
  void dispose() {
    widget._notifications.removeListener(_containsListener);
    _positionAnimationController.removeListener(_containsListener);
    _positionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _positionAnimation.value,
          child: Container(
            color: AppColors.red,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: List.generate(
                  _changedList.length,
                  (index) => SizedBox(
                    height: 50,
                    child: Text(_changedList[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _containsListener() {
    if (widget._notifications.value.isNotEmpty) {
      _tween.begin = ((widget._notifications.value.length * 50) + 50) * -1;
      _tween.end = 0;
      _changedList = widget._notifications.value.map((e) => e).toList();
      _positionAnimationController.forward();
    } else {
      _positionAnimationController.reverse().then((value) {
        _changedList = widget._notifications.value.map((e) => e).toList();
      });
    }
    setState(() {});
  }
}
