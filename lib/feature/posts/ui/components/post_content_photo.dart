import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/const/const.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/helpers/helpers.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'post_content_image_fullscreen.dart';

class PostContentPhoto extends StatelessWidget {
  const PostContentPhoto({
    Key? key,
    required this.photos,
  }) : super(key: key);
  final List<PostPhotoEntity> photos;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallSize = (width / 2) - verticalPadding - (verticalPadding / 4);

    switch (photos.length) {
      case 1:
        return GestureDetector(
          onTap: () {
            Helpers.unfocused();
            showDialog(
              useSafeArea: false,
              context: context,
              builder: (context) => GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child:
                    PostContentImageFullScreen(photos: photos, currentIndex: 0),
              ),
            );
          },
          child: Container(
            color: AppColors.hintTextColor.withOpacity(.03),
            width: width,
            child: Container(
              margin: const EdgeInsets.all(verticalPadding),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mainRadius),
              ),
              child: Image.network(photos[0].photo, fit: BoxFit.cover),
            ),
          ),
        );

      case 2:
        return Container(
          color: AppColors.hintTextColor.withOpacity(.03),
          width: width,
          height: width,
          child: Container(
            margin: const EdgeInsets.all(verticalPadding),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mainRadius),
            ),
            child: Row(
              children: [
                _ItemWidget(
                  height: width,
                  width: smallSize,
                  photo: photos[0].photo,
                  photos: photos,
                  index: 0,
                ),
                const SizedBox(width: verticalPadding / 2),
                _ItemWidget(
                  height: width,
                  width: smallSize,
                  photo: photos[1].photo,
                  photos: photos,
                  index: 1,
                ),
              ],
            ),
          ),
        );

      case 3:
        return Container(
          color: AppColors.hintTextColor.withOpacity(.03),
          width: width,
          height: width,
          child: Container(
            margin: const EdgeInsets.all(verticalPadding),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mainRadius),
            ),
            child: Row(
              children: [
                _ItemWidget(
                  height: width,
                  width: smallSize,
                  photo: photos[0].photo,
                  photos: photos,
                  index: 0,
                ),
                const SizedBox(width: verticalPadding / 2),
                Column(
                  children: [
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[1].photo,
                      photos: photos,
                      index: 1,
                    ),
                    const SizedBox(height: verticalPadding / 2),
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[2].photo,
                      photos: photos,
                      index: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      case 4:
        return Container(
          color: AppColors.hintTextColor.withOpacity(.03),
          width: width,
          height: width,
          child: Container(
            margin: const EdgeInsets.all(verticalPadding),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mainRadius),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[0].photo,
                      photos: photos,
                      index: 0,
                    ),
                    const SizedBox(height: verticalPadding / 2),
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[1].photo,
                      photos: photos,
                      index: 1,
                    ),
                  ],
                ),
                const SizedBox(width: verticalPadding / 2),
                Column(
                  children: [
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[2].photo,
                      photos: photos,
                      index: 2,
                    ),
                    const SizedBox(height: verticalPadding / 2),
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[3].photo,
                      photos: photos,
                      index: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

      default:
        return Container(
          color: AppColors.hintTextColor.withOpacity(.03),
          width: width,
          height: width,
          child: Container(
            margin: const EdgeInsets.all(verticalPadding),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mainRadius),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[0].photo,
                      photos: photos,
                      index: 0,
                    ),
                    const SizedBox(height: verticalPadding / 2),
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[1].photo,
                      photos: photos,
                      index: 1,
                    ),
                  ],
                ),
                const SizedBox(width: verticalPadding / 2),
                Column(
                  children: [
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[2].photo,
                      photos: photos,
                      index: 2,
                    ),
                    const SizedBox(height: verticalPadding / 2),
                    _ItemWidget(
                      height: smallSize,
                      width: smallSize,
                      photo: photos[3].photo,
                      lengthIfMore: photos.length - 3,
                      photos: photos,
                      index: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    }
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.photo,
    this.lengthIfMore,
    required this.photos,
    required this.index,
  }) : super(key: key);

  final double width;
  final double height;
  final String photo;
  final int? lengthIfMore;
  final List<PostPhotoEntity> photos;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return GestureDetector(
      onTap: () {
        Helpers.unfocused();
        showDialog(
          useSafeArea: false,
          context: context,
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child:
                PostContentImageFullScreen(photos: photos, currentIndex: index),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mainRadius / 2),
        ),
        width: width,
        height: height,
        child: lengthIfMore != null
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(photo, fit: BoxFit.cover),
                  Container(
                    color: AppColors.hintTextColor.withOpacity(.8),
                    child: Center(
                      child: Text(
                        '+$lengthIfMore',
                        style: theme.textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w700,
                          color:
                              theme.textTheme.headline4?.color?.withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : CachedNetworkImage(
                imageUrl: photo,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: AppColors.orange),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
      ),
    );
  }
}
