import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/const.dart';
import '../../../data/setting_provider/theme_provider.dart';
import '../../config/app_colors.dart';
import '../buttons/empty_button.dart';

class MoreMenuDialog extends StatelessWidget {
  const MoreMenuDialog({
    Key? key,
    required this.xOffset,
    required this.yOffset,
    required this.buttonWidth,
    required this.actions,
  }) : super(key: key);

  final double xOffset;
  final double yOffset;
  final double buttonWidth;
  final List<Map<String, Function()>> actions;

  static Future<Locale?> show(
    BuildContext context,
    GlobalKey key, {
    required List<Map<String, Function()>> actions,
  }) async {
    final barrierColor = Provider.of<ThemeProvider>(context, listen: false)
        .themeData
        .backgroundColor
        .withOpacity(.5);

    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final xOffset = renderBox.localToGlobal(Offset.zero).dx;
    final yOffset = renderBox.localToGlobal(Offset.zero).dy;
    final width = renderBox.size.width;

    return showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: barrierColor,
      builder: (context) => MoreMenuDialog(
        xOffset: xOffset,
        yOffset: yOffset,
        buttonWidth: width,
        actions: actions,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return LayoutBuilder(builder: (context, constraints) {
      final isOnRightHalf = xOffset > MediaQuery.of(context).size.width / 2;
      final isOnTopHalf = yOffset < constraints.maxHeight / 2;

      final maxWidth = isOnRightHalf
          ? xOffset - verticalPadding
          : constraints.maxWidth - (xOffset + buttonWidth) - verticalPadding;

      return Stack(
        children: [
          _positionedBuilder(
            context,
            isOnRightHalf,
            isOnTopHalf,
            child: Container(
              clipBehavior: Clip.hardEdge,
              constraints: BoxConstraints(maxWidth: maxWidth),
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.circular(verticalPadding),
                boxShadow: const [
                  BoxShadow(color: AppColors.hintTextColor, blurRadius: 5.0),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: actions
                    .map(
                      (e) => DialogItem(
                        description: e.keys.first,
                        onPressed: e.values.first,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      );
    });
  }

  _positionedBuilder(
    BuildContext context,
    bool isOnRightHalf,
    bool isOnTopHalf, {
    required Widget child,
  }) {
    return isOnRightHalf
        ? isOnTopHalf
            ? Positioned(
                top: yOffset + buttonWidth,
                right: MediaQuery.of(context).size.width - xOffset,
                child: child,
              )
            : Positioned(
                bottom: MediaQuery.of(context).size.height - yOffset,
                right: MediaQuery.of(context).size.width - xOffset,
                child: child,
              )
        : isOnTopHalf
            ? Positioned(
                top: yOffset + buttonWidth,
                left: xOffset + buttonWidth,
                child: child,
              )
            : Positioned(
                top: MediaQuery.of(context).size.height - yOffset,
                left: xOffset + buttonWidth,
                child: child,
              );
  }
}

class DialogItem extends StatelessWidget {
  const DialogItem({
    Key? key,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  final String description;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return EmptyButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: mainPadding,
          vertical: verticalPadding,
        ),
        child: Text(
          description,
          textAlign: TextAlign.end,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyText1,
        ),
      ),
    );
  }
}
