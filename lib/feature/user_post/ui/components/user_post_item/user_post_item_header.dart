import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../../app/di/init_di.dart';
import '../../../../../app/helpers/app_icons.dart';
import '../../../../../app/helpers/date_helper.dart';
import '../../../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../../../app/ui/components/dialog/more_menu_dialog.dart';
import '../../../../../app/ui/config/app_colors.dart';
import '../../../../profile/domain/state/profile_cubit.dart';

class UserPostItemHeader extends StatefulWidget {
  const UserPostItemHeader({
    Key? key,
    required this.avatar,
    required this.postEntity,
    required this.lastVisit,
  }) : super(key: key);

  final String? avatar;
  final PostEntity postEntity;
  final DateTime lastVisit;

  @override
  State<UserPostItemHeader> createState() => _UserPostItemHeaderState();
}

class _UserPostItemHeaderState extends State<UserPostItemHeader> {
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
    final avatarIsCircle = Provider.of<SettingProvider>(context).isCircleAvatar;
    final isOnline = DateHelper.isOnline(widget.lastVisit);
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
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: avatarIsCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: avatarIsCircle ? null : BorderRadius.circular(16),
                color: AppColors.hintTextColor.withOpacity(.1),
                border: Border.all(
                  color: isOnline ? AppColors.orange : AppColors.hintTextColor,
                  width: 2,
                  strokeAlign: StrokeAlign.outside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: widget.avatar != null
                  ? Image.network(
                      widget.avatar!,
                      fit: BoxFit.cover,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        AppIcons.profileIcon,
                        color: AppColors.hintTextColor,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 12,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.postEntity.author.firstName} ${widget.postEntity.author.lastName}',
                  style: theme.textTheme.headline6,
                ),
                Text(
                  DateHelper.wasPublished(context, widget.postEntity.created),
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            key: moreKey,
            onTap: _moreOnPressed,
            child: const Icon(
              Icons.more_horiz,
              size: 24,
              color: AppColors.hintTextColor,
            ),
          ),
        ],
      ),
    );
  }

  void _moreOnPressed() {
    MoreMenuDialog.show(
      context,
      moreKey,
      actions: currentUser == widget.postEntity.author.id
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
