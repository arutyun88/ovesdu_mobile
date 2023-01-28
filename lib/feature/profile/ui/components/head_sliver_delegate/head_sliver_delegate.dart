import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/app_actions.dart';
import '../../../state/profile_cubit.dart';
import '../../../state/user_blocked/user_blocked_cubit.dart';
import '../../../state/user_profile_cubit.dart';
import 'or_else_widget.dart';
import 'received_widget.dart';

const titleMaxHeight = 140.0;

class HeadSliverDelegate extends SliverPersistentHeaderDelegate {
  late double _titleMinHeight = 120.0;

  final double expandedHeight;
  final UserProfileEntity? entity;
  final VoidCallback? onTapToBack;

  HeadSliverDelegate(
    this.expandedHeight,
    this.entity, {
    this.onTapToBack,
  });

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
          blockedOnTap: () =>
              AppActions.blockedOnTap(context, entity?.id ?? -1),
          onTapToBack: onTapToBack,
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
                        AppActions.blockedOnTap(context, entity?.id ?? -1),
                    onTapToBack: onTapToBack,
                  );
                }
                return Hero(
                  tag: user.username,
                  child: ReceivedWidget(
                    receivedUser: user,
                    expandedHeight: expandedHeight,
                    top: top,
                    zero: zero,
                    paddingTop: paddingTop,
                    blockedOnTap: () =>
                        AppActions.blockedOnTap(context, user.id),
                    onTapToBack: onTapToBack,
                  ),
                );
              },
              orElse: () => OrElseWidget(
                expandedHeight: expandedHeight,
                top: top,
                zero: zero,
                paddingTop: paddingTop,
                entity: entity,
                blockedOnTap: () =>
                    AppActions.blockedOnTap(context, entity?.id ?? -1),
                onTapToBack: onTapToBack,
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
}
