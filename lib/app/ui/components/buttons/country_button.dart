import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/countries.dart';
import '../../../data/setting_provider/theme_provider.dart';
import '../../config/app_colors.dart';

class CountryButton extends StatelessWidget {
  const CountryButton({
    Key? key,
    required Country selectedCountry,
    required this.onTap,
  })  : _selectedCountry = selectedCountry,
        super(key: key);

  final Country _selectedCountry;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 50,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.keyboard_arrow_down,
                size: 24,
                color: AppColors.orange,
              ),
              const SizedBox(width: 4.0),
              Text(
                '+${_selectedCountry.dialCode}',
                style: Provider.of<ThemeProvider>(context)
                    .themeData
                    .textTheme
                    .headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
