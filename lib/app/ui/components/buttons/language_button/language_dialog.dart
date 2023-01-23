import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../const/const.dart';
import '../../../../data/setting_provider/theme_provider.dart';
import '../../../config/app_colors.dart';

const double itemHeight = 40;

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    Key? key,
    required this.locales,
    required this.currentLocale,
    required this.xOffset,
    required this.yOffset,
    required this.buttonWidth,
  }) : super(key: key);

  final List<Locale> locales;
  final Locale currentLocale;
  final double xOffset;
  final double yOffset;
  final double buttonWidth;

  static Future<Locale?> show(
    BuildContext context,
    GlobalKey key,
    List<Locale> locales,
    Locale currentLocale,
  ) async {
    final barrierColor = Provider.of<ThemeProvider>(context, listen: false)
        .themeData
        .backgroundColor
        .withOpacity(.7);

    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final xOffset = renderBox.localToGlobal(Offset.zero).dx;
    final yOffset = renderBox.localToGlobal(Offset.zero).dy;
    final width = renderBox.size.width;

    return showDialog(
      context: context,
      barrierColor: barrierColor,
      useRootNavigator: false,
      useSafeArea: false,
      builder: (context) => LanguageDialog(
        locales: locales,
        currentLocale: currentLocale,
        xOffset: xOffset,
        yOffset: yOffset,
        buttonWidth: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final openedHeight = locales.length * itemHeight;

        final safeArea = MediaQuery.of(context).padding;
        final bottom = safeArea.bottom + verticalPadding;

        final isOnRightHalf = xOffset > MediaQuery.of(context).size.width / 2;
        final maxWidth = isOnRightHalf
            ? constraints.maxWidth -
                mainPadding -
                (constraints.maxWidth - xOffset)
            : constraints.maxWidth - xOffset - mainPadding;

        final availableVerticalSpace = constraints.maxHeight -
            yOffset -
            languageButtonSize -
            verticalPadding;

        final showAtTop = openedHeight > availableVerticalSpace &&
            yOffset > constraints.maxHeight / 2;

        var calculatedYOffset = showAtTop
            ? yOffset - openedHeight - verticalPadding
            : yOffset + languageButtonSize + verticalPadding;

        final wouldOverlay =
            calculatedYOffset + openedHeight > constraints.maxHeight - bottom ||
                calculatedYOffset < safeArea.top;
        if (wouldOverlay && showAtTop) calculatedYOffset = safeArea.top;
        final maxOpenedHeight = wouldOverlay
            ? showAtTop
                ? yOffset - safeArea.top - verticalPadding
                : availableVerticalSpace - bottom
            : openedHeight;

        return Stack(
          children: [
            _positionedChild(
              context,
              xOffset,
              calculatedYOffset,
              maxOpenedHeight,
              isOnRightHalf,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: _buildContent(context, maxOpenedHeight),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _positionedChild(
    BuildContext context,
    double xOffset,
    double yOffset,
    double dropdownHeight,
    bool isOnRightHalf, {
    required Widget child,
  }) {
    return isOnRightHalf
        ? Positioned(
            top: yOffset,
            height: dropdownHeight,
            right: MediaQuery.of(context).size.width - xOffset,
            child: child,
          )
        : Positioned(
            top: yOffset,
            height: dropdownHeight,
            left: xOffset,
            child: child,
          );
  }

  Widget _buildContent(BuildContext context, double maxExpandedHeight) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).themeData.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(color: AppColors.hintTextColor, blurRadius: 5.0)
          ],
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxExpandedHeight),
          child: _languageList(context),
        ),
      ),
    );
  }

  Widget _languageList(
    BuildContext context,
  ) {
    final theme =
        Provider.of<ThemeProvider>(context).themeData.textTheme.headline6;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          locales.length,
          (index) => Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(locales[index]),
              child: SizedBox(
                height: itemHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          L10n.getLanguage(locales[index].languageCode),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: theme?.apply(
                            color: currentLocale == locales[index]
                                ? theme.color
                                : theme.color?.withOpacity(.6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          locales[index].languageCode,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: theme?.apply(
                            color: currentLocale == locales[index]
                                ? theme.color
                                : theme.color?.withOpacity(.6),
                          ),
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
    );
  }
}
