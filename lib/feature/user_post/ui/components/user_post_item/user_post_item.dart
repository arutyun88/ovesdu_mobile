import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/const/const.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../posts/ui/components/post_statistic.dart';
import '../../../state/user_post_cubit.dart';
import '../../../../posts/ui/components/post_content.dart';
import 'user_post_item_header_light.dart';

class UserPostItem extends StatelessWidget {
  const UserPostItem({
    Key? key,
    required this.avatar,
    required this.lastVisit,
    required this.post,
  }) : super(key: key);

  final String? avatar;
  final DateTime lastVisit;
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Container(
      margin: const EdgeInsets.only(bottom: mainPadding),
      width: MediaQuery.of(context).size.width,
      color: theme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserPostItemHeaderLight(post: post),
          Hero(
            tag: '${post.id}:${post.author.lastName}.${post.author.firstName}',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PostContent(post: post),
                PostStatistic(
                  avatar: avatar,
                  post: post,
                  lastVisit: lastVisit,
                  whenChanged: (PostEntity entity) {
                    context.read<UserPostCubit>().postUpdated(entity);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
