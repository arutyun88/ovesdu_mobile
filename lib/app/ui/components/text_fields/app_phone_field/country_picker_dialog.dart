import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ovesdu_mobile/app/ui/config/app_style.dart';

import '../../../../const/countries.dart';
import '../../../../helpers/helpers.dart';
import '../app_text_field.dart';

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final ValueChanged<Country> onCountryChanged;
  final List<Country> filteredCountries;

  const CountryPickerDialog({
    Key? key,
    required this.countryList,
    required this.onCountryChanged,
    required this.filteredCountries,
  }) : super(key: key);

  @override
  State<CountryPickerDialog> createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;

  @override
  void initState() {
    _filteredCountries = widget.filteredCountries;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24.0),
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppTextField(
              labelText: AppLocalizations.of(context)!.searchCountryLabel,
              hintText: AppLocalizations.of(context)!.searchCountryHint,
              onChanged: (value) {
                _filteredCountries = Helpers.isNumeric(value)
                    ? widget.countryList
                        .where((country) => country.dialCode.contains(value))
                        .toList()
                    : widget.countryList
                        .where((country) => country.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                if (mounted) setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text(
                  _filteredCountries[index].flag,
                  style: const TextStyle().withSize(32.0),
                ),
                title: Text(
                  _filteredCountries[index].name,
                  style: const TextStyle().withWeight(FontWeight.w700),
                ),
                trailing: Text(
                  '+${_filteredCountries[index].dialCode}',
                  style: const TextStyle().withWeight(FontWeight.w700),
                ),
                onTap: () {
                  widget.onCountryChanged(_filteredCountries[index]);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
