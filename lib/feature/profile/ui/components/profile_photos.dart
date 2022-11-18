import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'item_divider.dart';
import 'profile_item_title.dart';

const double _photoHeight = 180.0;

class ProfilePhotos extends StatelessWidget {
  const ProfilePhotos({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Column(
      children: [
        const ItemDivider(),
        ProfileItemTitle(itemTitle: dictionary.photos),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: _photoHeight + 12.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16.0 : 4.0,
                right: index == images.length - 1 ? 16.0 : 4.0,
                top: 4.0,
                bottom: 8.0,
              ),
              child: Container(
                width: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: theme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.hintTextColor.withOpacity(.3),
                      blurRadius: 2.0,
                    )
                  ],
                ),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
