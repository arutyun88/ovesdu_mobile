import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../app/di/init_di.dart';
import '../../../../app/ui/components/item_divider.dart';
import '../../state/profile_cubit.dart';
import 'follower_item.dart';

class FollowList extends StatelessWidget {
  const FollowList({
    Key? key,
    required this.itemsKey,
    required this.items,
    required this.myFollowers,
    required this.blackList,
    required this.height,
  }) : super(key: key);

  final String itemsKey;
  final List<UserProfileFollowerItemEntity> items;
  final UserSimpleFollowersEntity? myFollowers;
  final List<int> blackList;
  final double height;

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

    return SizedBox(
      height: height,
      child: ListView(
        padding: EdgeInsets.zero,
        key: PageStorageKey<String>(itemsKey),
        children: List.generate(
          sortedList.length,
          (index) {
            final isBlocked = blackList.contains(
              int.parse(sortedList[index].id),
            );
            return index != sortedList.length - 1
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FollowerItem(
                        sortedList[index],
                        myFollowers,
                        isBlocked: isBlocked,
                      ),
                      const ItemDivider(),
                    ],
                  )
                : FollowerItem(
                    sortedList[index],
                    myFollowers,
                    isBlocked: isBlocked,
                  );
          },
        ),
      ),
    );
  }
}
