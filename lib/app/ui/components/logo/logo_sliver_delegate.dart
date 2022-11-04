import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../data/setting_provider/theme_provider.dart';
import 'logo_widget.dart';

class LogoDelegate extends SliverPersistentHeaderDelegate {
  final double _maxHeaderSize;
  final double _minHeaderSize;
  final double _maxTextSize;
  final double _minTextSize;
  final ValueNotifier<bool> isAuth;

  LogoDelegate(double size, this.isAuth)
      : _maxHeaderSize = size * 0.8,
        _minHeaderSize = size * 0.8 / 3,
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
        if ((1 - percent) > .70)
          Positioned(
            top: 10,
            left: 34,
            child: ValueListenableBuilder<bool>(
              valueListenable: isAuth,
              builder: (context, auth, child) {
                final style = Provider.of<ThemeProvider>(context, listen: false)
                    .themeData
                    .textTheme
                    .headline5;
                return Text(
                  auth
                      ? AppLocalizations.of(context)!.loginTitleSignIn
                      : AppLocalizations.of(context)!.loginTitleSignUp,
                  style: style?.apply(color: style.color?.withOpacity(.3)),
                );
              },
            ),
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
