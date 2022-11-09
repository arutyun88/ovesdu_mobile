import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../data/setting_provider/theme_provider.dart';
import '../setting_widget.dart';
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
        if ((1 - percent) > .60)
          Positioned(
            top: 10,
            left: 34,
            child: ValueListenableBuilder<bool>(
              valueListenable: isAuth,
              builder: (context, auth, child) {
                final style = Provider.of<ThemeProvider>(context)
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
        if ((1 - percent) > .60)
          const Positioned(
            top: 10,
            right: 34,
            child: SettingWidget(),
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
