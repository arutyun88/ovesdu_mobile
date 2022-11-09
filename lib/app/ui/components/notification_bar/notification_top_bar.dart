import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/setting_provider/theme_provider.dart';
import '../../config/app_colors.dart';

class NotificationTopBar extends StatefulWidget {
  const NotificationTopBar({
    Key? key,
    required ValueNotifier<List<String>> notifications,
  })  : _notifications = notifications,
        super(key: key);

  final ValueNotifier<List<String>> _notifications;

  @override
  State<NotificationTopBar> createState() => _NotificationTopBarState();
}

class _NotificationTopBarState extends State<NotificationTopBar>
    with TickerProviderStateMixin {
  late AnimationController _positionAnimationController;
  late Animation<double> _positionAnimation;
  late Tween<double> _tween;
  late List _changedList;
  late ThemeProvider theme;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _positionAnimation.value,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              bottom: false,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: theme.themeData.hintColor,
                      blurRadius: 5.0,
                    )
                  ],
                  color: theme.isLightTheme
                      ? AppColors.red.withOpacity(.6)
                      : AppColors.red.withOpacity(.9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    _changedList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 8),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.hintTextColor.withOpacity(.7),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              _changedList[index],
                              textAlign: TextAlign.left,
                              style: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .textTheme
                                  .bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
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
