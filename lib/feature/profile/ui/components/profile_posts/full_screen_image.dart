import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../user_post/domain/entity/user_post/user_post_photo_entity.dart';

class FullScreenImage extends StatefulWidget {
  const FullScreenImage({
    Key? key,
    required this.photos,
    required this.currentIndex,
  }) : super(key: key);

  final List<UserPostPhotoEntity> photos;
  final int currentIndex;

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  late PageController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.currentIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          color: theme.backgroundColor,
          child: PageView(
            controller: controller,
            children: widget.photos
                .map(
                  (e) => Image.network(
                    e.photo,
                    fit: BoxFit.contain,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
