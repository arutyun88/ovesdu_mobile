import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/setting_provider/setting_provider.dart';
import '../../../data/setting_provider/theme_provider.dart';
import '../../../di/init_di.dart';
import '../../../domain/entities/post_entity/post_entity.dart';
import '../../../helpers/date_helper.dart';
import '../author/author_small_avatar.dart';
import '../custom_dialog/custom_dialog.dart';
import '../dialog/more_menu_dialog.dart';
import '../../config/app_colors.dart';
import '../../../../feature/profile/domain/state/profile_cubit.dart';

class PostHeader extends StatefulWidget {
  const PostHeader({
    Key? key,
    required this.post,
    required this.onTapToRead,
  }) : super(key: key);

  final PostEntity post;
  final Function(PostEntity) onTapToRead;

  @override
  State<PostHeader> createState() => _PostHeaderState();
}

class _PostHeaderState extends State<PostHeader> {
  final moreKey = GlobalKey();
  late ThemeData theme;
  late AppLocalizations dictionary;
  late int currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = locator
            .get<ProfileCubit>()
            .state
            .whenOrNull(received: (user) => user.id) ??
        -1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
    dictionary = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<SettingProvider>(context, listen: false)
                  .setCircleAvatar();
            },
            child: AuthorSmallAvatar(
              avatar: widget.post.author.avatar,
              lastVisit: widget.post.author.lastVisit,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                bottom: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.post.author.firstName} ${widget.post.author.lastName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headline6,
                  ),
                  Text(
                    DateHelper.wasPublished(context, widget.post.created),
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: AppColors.hintTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            key: moreKey,
            onTap: _moreOnPressed,
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: currentUser == widget.post.author.id
                  ? AppColors.orange
                  : AppColors.hintTextColor,
            ),
          )
        ],
      ),
    );
  }

  void _moreOnPressed() {
    MoreMenuDialog.show(
      context,
      moreKey,
      actions: currentUser == widget.post.author.id
          ? [
              {
                dictionary.editPost: () {
                  Navigator.of(context).pop();
                  widget.onTapToRead(widget.post);
                }
              },
              {
                dictionary.deletePost: () {
                  Navigator.of(context).pop();
                  _deletePostOnPressed();
                }
              },
            ]
          : [
              {
                dictionary.complainToPost: () {
                  Navigator.of(context).pop();
                  CustomDialog.showMessageDialog(
                    context,
                    dictionary.inDeveloping,
                  );
                }
              },
              {
                dictionary.complainToUser: () {
                  Navigator.of(context).pop();
                  CustomDialog.showMessageDialog(
                    context,
                    dictionary.inDeveloping,
                  );
                }
              },
            ],
    );
  }

  void _deletePostOnPressed() {
    CustomDialog.showMessageDialog(
      context,
      dictionary.inDeveloping,
    );
  }
}
