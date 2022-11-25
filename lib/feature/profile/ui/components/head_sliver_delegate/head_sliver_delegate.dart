import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/di/init_di.dart';
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

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          received: (receivedUser) {
            return locator.get<ProfileCubit>().state.maybeWhen(
                  received: (user) => !user.blockedUsersId
                          .contains(receivedUser.id)
                      ? BlocBuilder<UserBlockedCubit, UserBlockedState>(
                          builder: (context, blockedState) {
                            return blockedState.maybeWhen(
                              added: (id) => OrElseWidget(
                                expandedHeight: expandedHeight,
                                top: top,
                                zero: zero,
                                paddingTop: paddingTop,
                                entity: entity,
                                blockedOnTap: () =>
                                    _blockedOnTap(context, entity?.id ?? -1),
                              ),
                              orElse: () => ReceivedWidget(
                                receivedUser: receivedUser,
                                expandedHeight: expandedHeight,
                                top: top,
                                zero: zero,
                                paddingTop: paddingTop,
                                blockedOnTap: () =>
                                    _blockedOnTap(context, receivedUser.id),
                              ),
                            );
                          },
                        )
                      : OrElseWidget(
                          expandedHeight: expandedHeight,
                          top: top,
                          zero: zero,
                          paddingTop: paddingTop,
                          entity: entity,
                          blockedOnTap: () =>
                              _blockedOnTap(context, entity?.id ?? -1),
                        ),
                  orElse: () => OrElseWidget(
                    expandedHeight: expandedHeight,
                    top: top,
                    zero: zero,
                    paddingTop: paddingTop,
                    entity: entity,
                    blockedOnTap: () =>
                        _blockedOnTap(context, entity?.id ?? -1),
                  ),
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
      context.read<UserBlockedCubit>().addBlocked(id.toString());
      locator.get<ProfileCubit>().addedBlocked(id);
    }
  }
}
