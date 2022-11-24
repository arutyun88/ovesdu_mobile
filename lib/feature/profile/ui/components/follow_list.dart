import 'package:flutter/material.dart';

import '../../../../app/di/init_di.dart';
import '../../domain/entities/user_profile_follower/user_profile_follower_item_entity.dart';
import '../../domain/entities/user_profile_follower/user_simple_followers_entity.dart';
import '../../domain/state/profile_cubit.dart';
import 'follower_item.dart';

class FollowList extends StatelessWidget {
  const FollowList({
    Key? key,
    required this.itemsKey,
    required this.items,
    required this.myFollowers,
    required this.blackList,
  }) : super(key: key);

  final String itemsKey;
  final List<UserProfileFollowerItemEntity> items;
  final UserSimpleFollowersEntity? myFollowers;
  final List<int> blackList;

  List<UserProfileFollowerItemEntity> _sort(
    List<UserProfileFollowerItemEntity> items,
    int currentUserId,
  ) {
    final result = <UserProfileFollowerItemEntity>[];

    final copy = items.map((e) => e).toList();

    final its = copy.where((e) => int.parse(e.id) == currentUserId).toList();
    if (its.isNotEmpty) {
      result.add(its.first);
      copy.remove(its.first);
    }

    copy.sort(
      (left, right) {
        final comparisonResult = left.firstName.toLowerCase().compareTo(
              right.firstName.toLowerCase(),
            );
        if (comparisonResult != 0) {
          return comparisonResult;
        }
        return left.lastName.toLowerCase().compareTo(
              right.lastName.toLowerCase(),
            );
      },
    );
    result.addAll(copy);

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final userId = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (profile) => profile.id) ??
        0;

    var sortedList = _sort(items, userId);

    return ListView(
      key: PageStorageKey<String>(itemsKey),
      children: sortedList.map(
        (item) {
          final isBlocked = blackList.contains(int.parse(item.id));

          return FollowerItem(
            item,
            myFollowers,
            isBlocked: isBlocked,
          );
        },
      ).toList(),
    );
  }
}
