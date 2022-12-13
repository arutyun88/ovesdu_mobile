import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/profile/domain/state/profile_cubit.dart';
import '../../feature/profile/domain/state/user_blocked/user_blocked_cubit.dart';
import '../../feature/user_post/domain/state/user_post_cubit.dart';
import '../di/init_di.dart';
import '../ui/components/custom_dialog/custom_dialog.dart';

abstract class AppActions {
  const AppActions._();

  static void blockedOnTap(BuildContext context, int id) {
    final blocked = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (user) => user.blockedUsersId.contains(id)) ??
        false;
    if (blocked) {
      context.read<UserBlockedCubit>().removeBlocked(id.toString());
      locator.get<ProfileCubit>().removeBlocked(id).whenComplete(() {
        context.read<UserPostCubit>().getUserPosts(
              id: id,
              limit: 10,
              last: 0,
            );
      });
    } else {
      CustomDialog.showBlockDialog(context).then(
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
