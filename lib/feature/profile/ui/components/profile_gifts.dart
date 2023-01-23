import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/setting_provider.dart';
import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import '../../../../app/ui/components/item_divider.dart';
import 'profile_item_title.dart';

const double _giftSize = 125.0;

class ProfileGifts extends StatelessWidget {
  const ProfileGifts({
    Key? key,
    required this.gifts,
  }) : super(key: key);

  final List<GiftEntity> gifts;

  @override
  Widget build(BuildContext context) {
    final dictionary = AppLocalizations.of(context)!;
    return Column(
      children: [
        const ItemDivider(),
        ProfileItemTitle(itemTitle: dictionary.gifts),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: _giftSize + 12.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gifts.length,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.only(
                left: index == 0 ? 16.0 : 4.0,
                right: index == gifts.length - 1 ? 16.0 : 4.0,
                top: 4.0,
                bottom: 8.0,
              ),
              child: _GiftItem(
                item: gifts[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GiftItem extends StatelessWidget {
  const _GiftItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final GiftEntity item;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    final avatar = Provider.of<SettingProvider>(context).isCircleAvatar;
    return Container(
      height: _giftSize,
      width: _giftSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: theme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.hintTextColor.withOpacity(.3),
            blurRadius: 2.0,
          )
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            _getGift(item.type),
            fit: BoxFit.none,
          ),
          if (item.isReal)
            const Positioned(
              top: 6,
              right: 6,
              child: Icon(
                Icons.star,
                color: AppColors.orange,
              ),
            ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: avatar ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: avatar ? null : BorderRadius.circular(16),
                color: AppColors.hintTextColor.withOpacity(.7),
                border: Border.all(
                  color: AppColors.orange,
                  width: 4,
                  strokeAlign: StrokeAlign.outside,
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: item.sender != null
                  ? Image.network(
                      'http://zornet.ru/_fr/82/0090372.jpg',
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: AppColors.transparent,
                      child: Center(
                        child: Text(
                          'A',
                          style: theme.textTheme.headline5?.copyWith(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String _getGift(Gift id) {
    switch (id) {
      case Gift.a1:
      case Gift.b1:
        return 'http://zornet.ru/_fr/82/1125145.jpg';
      case Gift.a2:
      case Gift.b2:
        return 'http://zornet.ru/_fr/82/3470609.jpg';
      case Gift.a3:
      case Gift.b3:
        return 'http://zornet.ru/_fr/82/0547098.jpg';
      case Gift.a4:
      case Gift.b4:
        return 'http://zornet.ru/_fr/82/6972558.jpg';
      case Gift.a5:
      case Gift.b5:
        return 'http://zornet.ru/_fr/82/1335650.jpg';
      case Gift.a6:
      case Gift.b6:
        return 'http://zornet.ru/_fr/82/5332316.jpg';
      case Gift.a7:
      case Gift.b7:
        return 'http://zornet.ru/_fr/82/8567927.jpg';
      case Gift.a8:
      case Gift.b8:
        return 'http://zornet.ru/_fr/82/4847193.jpg';
      case Gift.a9:
      case Gift.b9:
        return 'http://zornet.ru/_fr/82/3854504.jpg';
      case Gift.a10:
      case Gift.b10:
        return 'http://zornet.ru/_fr/82/3743547.jpg';
    }
  }
}

class GiftEntity {
  final Gift type;
  final bool isReal;
  final String? sender;

  GiftEntity(this.type, this.isReal, this.sender);
}

enum Gift {
  a1,
  a2,
  a3,
  a4,
  a5,
  a6,
  a7,
  a8,
  a9,
  a10,
  b1,
  b2,
  b3,
  b4,
  b5,
  b6,
  b7,
  b8,
  b9,
  b10,
}
