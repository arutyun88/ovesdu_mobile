import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/ui/widgets/logo_widget.dart';

class LogoDelegate extends SliverPersistentHeaderDelegate {
  final double _maxHeaderSize;
  final double _minHeaderSize;
  final double _maxTextSize;
  final double _minTextSize;

  LogoDelegate(double size)
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

    return LogoWidget(fontSize: currentTextSize);
  }

  @override
  double get maxExtent => _maxHeaderSize;

  @override
  double get minExtent => _minHeaderSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}