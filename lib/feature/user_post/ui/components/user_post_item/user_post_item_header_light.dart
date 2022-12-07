import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/const/const.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../../../app/ui/components/dialog/more_menu_dialog.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../profile/domain/state/profile_cubit.dart';
import '../../../domain/entity/user_post/user_post_entity.dart';

class UserPostItemHeaderLight extends StatefulWidget {
  const UserPostItemHeaderLight({
    Key? key,
    required this.post,
  }) : super(key: key);

  final UserPostEntity post;

  @override
  State<UserPostItemHeaderLight> createState() =>
      _UserPostItemHeaderLightState();
}

class _UserPostItemHeaderLightState extends State<UserPostItemHeaderLight> {
  late AppLocalizations dictionary;
  late int currentUser;
  final moreKey = GlobalKey();

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
    dictionary = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(mainRadius),
        ),
        color: theme.backgroundColor,
      ),
      child: Container(
        color: AppColors.hintTextColor.withOpacity(.1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: iconSize),
                  const Spacer(),
                  Text(
                    DateHelper.wasPublished(context, widget.post.created),
                    style: theme.textTheme.bodyText1?.copyWith(
                      color: AppColors.hintTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    key: moreKey,
                    onTap: _moreOnPressed,
                    child: const Icon(
                      Icons.more_vert,
                      size: iconSize,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(mainRadius),
                ),
                color: theme.backgroundColor,
              ),
              height: mainRadius,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
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
                  CustomDialog.showMessageDialog(
                    context,
                    dictionary.inDeveloping,
                  );
                }
              },
              {
                dictionary.deletePost: () {
                  Navigator.of(context).pop();
                  CustomDialog.showMessageDialog(
                    context,
                    dictionary.inDeveloping,
                  );
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
}
