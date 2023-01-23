import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../user_post/domain/state/user_post_cubit.dart';
import '../../../user_post/ui/components/user_post_item/user_post_item.dart';
import '../../../../app/ui/components/item_divider.dart';
import 'profile_item_title.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({
    Key? key,
    required this.avatar,
    required this.lastVisit,
  }) : super(key: key);

  final String? avatar;
  final DateTime lastVisit;

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Column(
      children: [
        const ItemDivider(),
        ProfileItemTitle(itemTitle: dictionary.posts),
        const SizedBox(height: 16),
        BlocBuilder<UserPostCubit, UserPostState>(
          builder: (context, state) {
            return state.maybeWhen(
              received: (posts) {
                return Column(
                  children: List.generate(
                    posts.posts.length,
                    (index) => UserPostItem(
                      avatar: avatar,
                      lastVisit: lastVisit,
                      post: posts.posts[index],
                    ),
                  ),
                );
              },
              error: (error) => Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Center(
                  child: Text(
                    error.message,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline6?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: theme.textTheme.headline6?.color?.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              orElse: () => const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: mainPadding),
                  child: CircularProgressIndicator(
                    color: AppColors.orange,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
