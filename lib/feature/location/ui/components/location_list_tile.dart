import 'package:flutter/material.dart';

import '../../../../app/ui/config/app_colors.dart';
import '../../domain/entities/location_entity/location_entity.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    Key? key,
    required this.location,
    required this.press,
  }) : super(key: key);

  final LocationEntity location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final city = location.city;
    final area = location.area;
    final country = location.country;
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.hintTextColor.withOpacity(.3),
              ),
            ),
          ),
          title: Text(
            '$city${_check(area)}${_check(country)}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.hintTextColor.withOpacity(.1),
        ),
      ],
    );
  }

  String _check(String value) {
    if (value.isEmpty) {
      return '';
    } else {
      return ', $value';
    }
  }
}
