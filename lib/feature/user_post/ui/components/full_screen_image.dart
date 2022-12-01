import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entity/user_post/user_post_photo_entity.dart';

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

class _FullScreenImageState extends State<FullScreenImage>
    with SingleTickerProviderStateMixin {
  late PageController controller;
  late TransformationController transformationController;
  late AnimationController transformationAnimationController;
  late Animation<Matrix4>? transformationAnimation;
  late ThemeData theme;

  final minScale = 1.0;
  final maxScale = 4.0;

  late int index = widget.currentIndex;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.currentIndex);
    transformationController = TransformationController();
    transformationAnimationController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    )..addListener(
        () => transformationController.value = transformationAnimation!.value,
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  void dispose() {
    controller.dispose();
    transformationController.dispose();
    transformationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: theme.backgroundColor,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (i) => setState(() => index = i),
            children: widget.photos
                .map(
                  (e) => InteractiveViewer(
                    transformationController: transformationController,
                    clipBehavior: Clip.none,
                    minScale: minScale,
                    maxScale: maxScale,
                    panEnabled: false,
                    onInteractionEnd: (details) => _resetAnimation(),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ClipRRect(
                        child: Image.network(
                          e.photo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: mainPadding,
            bottom: mainPadding,
            child: Text(
              '${index + 1}/${widget.photos.length}',
              style: theme.textTheme.headline6?.copyWith(
                color: AppColors.hintTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _resetAnimation() {
    transformationAnimation = Matrix4Tween(
      begin: transformationController.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(
        parent: transformationAnimationController,
        curve: Curves.ease,
      ),
    );

    transformationAnimationController.forward(from: 0);
  }
}
