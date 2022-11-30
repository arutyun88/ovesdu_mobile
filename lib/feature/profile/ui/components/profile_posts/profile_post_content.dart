import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../user_post/domain/entity/user_post/user_post_entity.dart';
import 'profile_post_photo_content.dart';

class ProfilePostContent extends StatefulWidget {
  const ProfilePostContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final UserPostEntity post;

  @override
  State<ProfilePostContent> createState() => _ProfilePostContentState();
}

class _ProfilePostContentState extends State<ProfilePostContent> {
  late final ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          if (widget.post.text != null && widget.post.text!.isNotEmpty)
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                widget.post.text!,
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
          if (widget.post.photos.isNotEmpty)
            ProfilePostPhotoContent(photos: widget.post.photos),
        ],
      ),
    );
  }
}
