import 'package:flutter/material.dart';

import '../../../const/countries.dart';

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
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _selectedCountry.flag,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 4.0),
              Text(
                '+${_selectedCountry.dialCode}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
