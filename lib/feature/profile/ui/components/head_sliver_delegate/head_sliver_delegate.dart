import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/ui/components/buttons/empty_button.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../domain/entities/user_profile/user_profile_entity.dart';
import '../../../domain/state/profile_cubit.dart';
import '../../../domain/state/user_blocked/user_blocked_cubit.dart';
import '../../../domain/state/user_profile_cubit.dart';
import 'or_else_widget.dart';
import 'received_widget.dart';

const titleMaxHeight = 140.0;

class HeadSliverDelegate extends SliverPersistentHeaderDelegate {
  late double _titleMinHeight = 120.0;

  final double expandedHeight;
  final UserProfileEntity? entity;

  HeadSliverDelegate(
    this.expandedHeight,
    this.entity,
  );

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final paddingTop = MediaQuery.of(context).padding.top;
    _titleMinHeight = paddingTop + 73;

    final zero = expandedHeight - shrinkOffset;
    final top = zero - titleMaxHeight;

    return BlocBuilder<UserBlockedCubit, UserBlockedState>(
      builder: (context, blockedState) => blockedState.maybeWhen(
        added: (id) => OrElseWidget(
          expandedHeight: expandedHeight,
          top: top,
          zero: zero,
          paddingTop: paddingTop,
          entity: entity,
          blockedOnTap: () => _blockedOnTap(context, entity?.id ?? -1),
        ),
        orElse: () => BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              received: (user) {
                final blocked = locator.get<ProfileCubit>().state.whenOrNull(
                        received: (user) =>
                            user.blockedUsersId.contains(entity?.id)) ??
                    false;
                if (blocked) {
                  return OrElseWidget(
                    expandedHeight: expandedHeight,
                    top: top,
                    zero: zero,
                    paddingTop: paddingTop,
                    entity: entity,
                    blockedOnTap: () =>
                        _blockedOnTap(context, entity?.id ?? -1),
                  );
                }
                return ReceivedWidget(
                  receivedUser: user,
                  expandedHeight: expandedHeight,
                  top: top,
                  zero: zero,
                  paddingTop: paddingTop,
                  blockedOnTap: () => _blockedOnTap(context, user.id),
                );
              },
              orElse: () => OrElseWidget(
                expandedHeight: expandedHeight,
                top: top,
                zero: zero,
                paddingTop: paddingTop,
                entity: entity,
                blockedOnTap: () => _blockedOnTap(context, entity?.id ?? -1),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => _titleMinHeight;

  @override
  bool shouldRebuild(covariant oldDelegate) => false;

  void _blockedOnTap(BuildContext context, int id) {
    final blocked = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (user) => user.blockedUsersId.contains(id)) ??
        false;
    if (blocked) {
      context.read<UserBlockedCubit>().removeBlocked(id.toString());
      locator.get<ProfileCubit>().removeBlocked(id);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          final theme = Provider.of<ThemeProvider>(context).themeData;
          final dictionary = AppLocalizations.of(context)!;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.circular(mainPadding),
                  border: Border.all(color: AppColors.orange, width: .2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: mainPadding,
                      ),
                      child: Column(
                        children: [
                          Text(
                            dictionary.sureWantToBlock,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headline6,
                          ),
                          const SizedBox(height: mainPadding),
                          Text(
                            dictionary.wontSeePage,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: mainPadding / 2),
                    Container(
                      color: theme.hintColor.withOpacity(.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            EmptyButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text(
                                dictionary.cancel,
                                style: theme.textTheme.headline6,
                              ),
                            ),
                            const SizedBox(width: verticalPadding),
                            EmptyButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(
                                dictionary.block,
                                style: theme.textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).then(
        (value) {
          if (value != null && (value as bool)) {
            context.read<UserBlockedCubit>().addBlocked(id.toString());
            locator.get<ProfileCubit>().addedBlocked(id);
          }
        },
      );
    }
  }
}
