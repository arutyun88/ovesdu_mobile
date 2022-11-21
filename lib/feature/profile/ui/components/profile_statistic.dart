import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'item_divider.dart';

class ProfileStatistic extends StatelessWidget {
  const ProfileStatistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    return SizedBox(
      height: 80.3,
      child: Column(
        children: [
          const ItemDivider(),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _ProfileStatisticItem(
                          itemKey: dictionary.coins,
                          itemValue: '9999',
                        ),
                        const VerticalItemDivider(),
                        _ProfileStatisticItem(
                          itemKey: dictionary.trust,
                          itemValue: '180',
                        ),
                        const VerticalItemDivider(),
                        _ProfileStatisticItem(
                          itemKey: dictionary.followers,
                          itemValue: '253',
                        ),
                        const VerticalItemDivider(),
                        _ProfileStatisticItem(
                          itemKey: dictionary.following,
                          itemValue: '12',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // child: Center(
            //   child: ListView(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     physics: const ClampingScrollPhysics(),
            //     children: [
            //       _ProfileStatisticItem(
            //         itemKey: dictionary.coins,
            //         itemValue: '9999',
            //       ),
            //       const VerticalItemDivider(),
            //       _ProfileStatisticItem(
            //         itemKey: dictionary.trust,
            //         itemValue: '180',
            //       ),
            //       const VerticalItemDivider(),
            //       _ProfileStatisticItem(
            //         itemKey: dictionary.followers,
            //         itemValue: '253',
            //       ),
            //       const VerticalItemDivider(),
            //       _ProfileStatisticItem(
            //         itemKey: dictionary.following,
            //         itemValue: '12',
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

class _ProfileStatisticItem extends StatelessWidget {
  const _ProfileStatisticItem({
    Key? key,
    required this.itemKey,
    required this.itemValue,
  }) : super(key: key);

  final String itemKey;
  final String itemValue;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 3,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              itemKey,
              maxLines: 1,
              style: theme.textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.hintTextColor,
              ),
            ),
            Text(
              itemValue,
              style: theme.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
