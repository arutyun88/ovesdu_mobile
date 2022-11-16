import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/date_helper.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/user_profile/user_profile_entity.dart';
import 'message_button.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    Key? key,
    required this.top,
    required this.userEntity,
  }) : super(key: key);

  final double top;
  final UserProfileEntity? userEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final dictionary = AppLocalizations.of(context)!;
    const imageUrl = 'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-'
        'Norris-Net-Worth-100-million.jpg';

    return Stack(
      children: [
        FlexibleSpaceBar(
          titlePadding: const EdgeInsets.only(
            left: 52.0,
            right: 24.0,
            bottom: 12.0,
          ),
          centerTitle: true,
          title: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: top <= 130 ? 1.0 : 0.0,
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.orange,
                      strokeAlign: StrokeAlign.outside,
                    ),
                  ),
                  child: const Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: mainPadding / 2,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userEntity?.firstName ?? '',
                          style: theme.textTheme.headline6,
                        ),
                        Text(
                          userEntity?.lastName ?? '',
                          style: theme.textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          background: Hero(
            tag: 'some',
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: top > 122 ? 1.0 : 0.0,
            child: Container(
              // height: 200,
              padding: const EdgeInsets.only(
                left: 24,
                top: 16,
                right: 16,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(mainPadding),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userEntity?.firstName ?? '',
                        style: theme.textTheme.headline5,
                      ),
                      Text(
                        userEntity?.lastName ?? '',
                        style: theme.textTheme.headline6,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${userEntity?.city ?? ''}, ${userEntity?.country ?? ''}',
                        style: theme.textTheme.bodyText2,
                      ),
                      Text(
                        '${ageCalculatedTitle(
                          context,
                          userEntity?.dateOfBirth ?? DateTime.now(),
                        )} / ${userEntity?.isMale ?? true ? dictionary.unmarriedM : dictionary.unmarriedW}',
                        style: theme.textTheme.bodyText2,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dictionary.unsubscribe,
                          style: theme.textTheme.headline6?.copyWith(
                            color: AppColors.hintTextColor,
                          ),
                        ),
                      ),
                      const MessageButton(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          child: SafeArea(
            bottom: false,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: AppColors.orange,
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    size: mainPadding,
                    color: AppColors.orange,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
