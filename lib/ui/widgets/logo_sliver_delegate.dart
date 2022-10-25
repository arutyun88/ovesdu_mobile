import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/app_colors.dart';
import 'logo_widget.dart';

class LogoDelegate extends SliverPersistentHeaderDelegate {
  final double _maxHeaderSize;
  final double _minHeaderSize;
  final double _maxTextSize;
  final double _minTextSize;
  final ValueNotifier<bool> isAuth;

  LogoDelegate(double size, this.isAuth)
      : _maxHeaderSize = size,
        _minHeaderSize = size / 3,
        _maxTextSize = size / 3,
        // _minTextSize = size / 5;
        _minTextSize = size / 3;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final percent = shrinkOffset / _maxHeaderSize;
    final currentTextSize =
        (_maxTextSize * (1 - percent)).clamp(_minTextSize, _maxTextSize);

    return Stack(
      children: [
        LogoWidget(fontSize: currentTextSize),
        if ((1 - percent) > .5)
          Positioned(
            top: 10,
            left: 34,
            child: ValueListenableBuilder<bool>(
                valueListenable: isAuth,
                builder: (context, auth, child) {
                  return Text(
                    auth
                        ? AppLocalizations.of(context)!.loginTitleSignIn
                        : AppLocalizations.of(context)!.loginTitleSignUp,
                    style: TextStyle(
                      fontSize: 24.0 * (1 - percent),
                      fontWeight: FontWeight.w200,
                      color: AppColors.hintTextColor,
                    ),
                  );
                }),
          ),
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderSize;

  @override
  double get minExtent => _minHeaderSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
