import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'item_divider.dart';
import 'profile_item_title.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<PostEntity> posts;

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Column(
      children: [
        const ItemDivider(),
        ProfileItemTitle(itemTitle: dictionary.posts),
        const SizedBox(height: 4),
        ...List.generate(
          posts.length,
          (index) => Container(
            margin: const EdgeInsets.only(bottom: 2),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  color: AppColors.purple.withOpacity(.05),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PostHeader(post: posts[index]),
                if (posts[index].text != null && posts[index].text!.isNotEmpty)
                  PostText(text: posts[index].text!),
                if (posts[index].image != null &&
                    posts[index].image!.isNotEmpty)
                  PostImage(image: posts[index].image!),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
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
