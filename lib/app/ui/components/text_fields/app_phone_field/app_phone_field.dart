import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../const/countries.dart';
import '../../../../data/setting_provider/theme_provider.dart';
import '../../../../domain/entities/phone_number.dart';
import '../../../config/app_colors.dart';
import '../../buttons/country_button.dart';
import 'country_picker_dialog.dart';

class AppPhoneField extends StatefulWidget {
  const AppPhoneField({
    Key? key,
    this.focus,
    this.borderColor = AppColors.orange,
    this.onChanged,
    this.hintText,
    this.labelText,
    required this.phone,
    required this.selectedCountryNotifier,
    this.otherFunction,
  }) : super(key: key);

  final FocusNode? focus;
  final Color borderColor;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final ValueNotifier<String> phone;
  final ValueNotifier<Country> selectedCountryNotifier;
  final Function()? otherFunction;

  @override
  State<AppPhoneField> createState() => _AppPhoneFieldState();
}

class _AppPhoneFieldState extends State<AppPhoneField> {
  late FocusNode node;
  late TextEditingController controller;
  late Country _selectedCountry;
  late List<Country> _countryList;
  late List<Country> _filteredCountries;

  @override
  initState() {
    super.initState();
    node = widget.focus ?? FocusNode();
    controller = TextEditingController();
    _selectedCountry = countries.firstWhere((country) => country.code == 'AM');
    _countryList = countries;
    _filteredCountries = _countryList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          CountryButton(
            selectedCountry: _selectedCountry,
            onTap: _changeCountry,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 180,
            child: TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(_selectedCountry.maxLength),
              ],
              keyboardType: TextInputType.number,
              controller: controller,
              focusNode: node,
              onChanged: (phone) {
                final phoneNumber = PhoneNumber(
                  countryISOCode: _selectedCountry.code,
                  countryCode: '+${_selectedCountry.dialCode}',
                  number: phone,
                );
                widget.phone.value = phoneNumber.completeNumber;
                if (widget.onChanged != null) {
                  widget.onChanged!(phone);
                }
              },
              cursorWidth: 1.0,
              cursorHeight: 30.0,
              style: Provider.of<ThemeProvider>(context)
                  .themeData
                  .textTheme
                  .headline5,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
                hintText: widget.hintText,
                labelText: widget.labelText,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: widget.borderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: .5,
                    color: widget.borderColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: .5,
                    color: widget.borderColor.withOpacity(.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _changeCountry() async {
    _filteredCountries = _countryList;
    await showDialog(
      context: context,
      builder: (context) => CountryPickerDialog(
        filteredCountries: _filteredCountries,
        countryList: _countryList,
        onCountryChanged: (Country country) {
          _selectedCountry = country;
          controller.clear();
          widget.phone.value = '';
          log(widget.phone.value);
          widget.selectedCountryNotifier.value = _selectedCountry;
          if (widget.otherFunction != null) {
            widget.otherFunction!();
          }
        },
      ),
    );
  }
}
