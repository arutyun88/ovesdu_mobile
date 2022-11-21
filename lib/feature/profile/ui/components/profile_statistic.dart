import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/state/user_profile_statistic/user_profile_statistic_cubit.dart';
import 'item_divider.dart';

class ProfileStatistic extends StatelessWidget {
  const ProfileStatistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Column(
      children: [
        const ItemDivider(),
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<UserProfileStatisticCubit,
              UserProfileStatisticState>(
            builder: (context, state) {
              return state.maybeWhen(
                received: (statistic) => CustomScrollView(
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
                              itemValue: statistic.coins,
                            ),
                            const VerticalItemDivider(),
                            _ProfileStatisticItem(
                              itemKey: dictionary.trust,
                              itemValue: statistic.trust,
                            ),
                            const VerticalItemDivider(),
                            _ProfileStatisticItem(
                              itemKey: dictionary.followers,
                              itemValue:
                                  statistic.followers.length.toString(),
                            ),
                            const VerticalItemDivider(),
                            _ProfileStatisticItem(
                              itemKey: dictionary.following,
                              itemValue:
                                  statistic.following.length.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                error: (error) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: mainPadding,
                  ),
                  child: Center(
                    child: Text(
                      error.message,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline6?.copyWith(
                        fontStyle: FontStyle.italic,
                        color:
                            theme.textTheme.headline6?.color?.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orange,
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
