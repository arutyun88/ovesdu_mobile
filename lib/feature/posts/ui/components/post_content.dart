import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/domain/entities/post_entity/post_entity.dart';
import 'post_content_photo.dart';

class PostContent extends StatefulWidget {
  const PostContent({
    Key? key,
    required this.post,
    this.isCommentScreen = false,
  }) : super(key: key);

  final PostEntity post;
  final bool isCommentScreen;

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
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
            PostContentPhoto(photos: widget.post.photos),
        ],
      ),
    );
  }
}
