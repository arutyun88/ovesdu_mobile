import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/app/data/setting_provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../user_post/domain/state/user_post_cubit.dart';
import 'item_divider.dart';
import 'profile_item_title.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Column(
      children: [
        const ItemDivider(),
        ProfileItemTitle(itemTitle: dictionary.posts),
        const SizedBox(height: 4),
        BlocBuilder<UserPostCubit, UserPostState>(
          builder: (context, state) {
            return state.maybeWhen(
              received: (posts) {
                return Column(
                  children: List.generate(
                    posts.posts.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 2),
                            color: AppColors.purple.withOpacity(.05),
                            blurRadius: 4.0,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // PostHeader(post: posts.posts[index]),
                          if (posts.posts[index].text != null &&
                              posts.posts[index].text!.isNotEmpty)
                            PostText(text: posts.posts[index].text!),
                          // if (posts.posts[index].image != null &&
                          //     posts.posts[index].image!.isNotEmpty)
                          //   PostImage(image: posts.posts[index].image!),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: AppColors.purple.withOpacity(.1),
                              width: MediaQuery.of(context).size.width,
                              height: 24,
                            ),
                          )
                        ],
                      ),
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

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class PostText extends StatelessWidget {
  const PostText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: theme.textTheme.bodyText2?.copyWith(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final avatar = Provider.of<SettingProvider>(context).isCircleAvatar;
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
                shape: avatar ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: avatar ? null : BorderRadius.circular(16),
                color: AppColors.hintTextColor,
                border: Border.all(
                  color: AppColors.orange,
                  width: 2,
                  strokeAlign: StrokeAlign.outside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-'
                'Norris-Net-Worth-100-million.jpg',
                fit: BoxFit.cover,
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
                  post.author,
                  style: theme.textTheme.headline6,
                ),
                Text(
                  post.time,
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_horiz,
            size: 24,
            color: AppColors.hintTextColor,
          ),
        ],
      ),
    );
  }
}

class PostEntity {
  final String id;
  final String author;
  final String? text;
  final String? image;
  final String? video;
  final String time;

  PostEntity({
    required this.id,
    required this.author,
    this.text,
    this.image,
    this.video,
    required this.time,
  });
}

// final List<PostEntity> posts = [
//   PostEntity(
//     id: 'id',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//     text: _longText,
//     image:
//     'http://zornet.ru/_fr/82/1132404.jpg',
//   ),
//   PostEntity(
//     id: 'id2',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//     text: _longText,
//   ),
//   PostEntity(
//       id: 'id3',
//       author:
//       '${userEntity.firstName} ${userEntity.lastName}',
//       time: 'time',
//       image:
//       'http://zornet.ru/_fr/82/8567927.jpg'),
//   PostEntity(
//     id: 'id4',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
//   PostEntity(
//     id: 'id5',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
//   PostEntity(
//     id: 'id6',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
//   PostEntity(
//     id: 'id7',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
//   PostEntity(
//     id: 'id8',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
//   PostEntity(
//     id: 'id9',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
//   PostEntity(
//     id: 'id10',
//     author:
//     '${userEntity.firstName} ${userEntity.lastName}',
//     time: 'time',
//   ),
// ];

// const String _longText = 'Some very long text. It\'s really very long text, '
//     'but I don\'t speak english.\n\nI share your point of view'
//     'A friend in need is a friend indeed.\n'
//     'Easy come, easy go. Time is money. Better late than never.'
//     '\n\nHave a good day';
