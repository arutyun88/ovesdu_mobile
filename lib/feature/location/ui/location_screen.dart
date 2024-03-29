import 'package:domain/domain.dart';
import 'package:domain/entity/location_entity/location_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovesdu_mobile/app/ui/app_loader.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/app_scaffold.dart';
import '../../../app/ui/components/text_fields/app_text_field.dart';
import '../../../app/ui/config/app_colors.dart';
import '../state/location_cubit.dart';
import 'components/location_list_tile.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(locator<LocationRepository>()),
      child: const _LocationScreen(),
    );
  }
}

class _LocationScreen extends StatefulWidget {
  const _LocationScreen({Key? key}) : super(key: key);

  @override
  State<_LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<_LocationScreen> {
  late ThemeData _theme;
  late int counter = 0;
  late List<LocationEntity> _values = [];
  late TextEditingController _cityController;
  late final ValueNotifier<List<String>> _notifications = ValueNotifier([]);
  late AppLocalizations _dictionary;
  late String _serverMessage = '';
  late bool _remote = false;
  late bool _waiting = false;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Provider.of<ThemeProvider>(context).themeData;
    _dictionary = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    _notifications.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        state.whenOrNull(
          received: (locations) {
            _notificationsRemove(_serverMessage);
            if (_cityController.text.isEmpty) return;
            _values = locations;
            _waiting = false;
            setState(() {});
          },
          requested: () {
            _notificationsRemove(_serverMessage);
            _waiting = true;
            setState(() {});
          },
          error: (error) {
            _serverMessage = error.message;
            _notificationsUpdate(_serverMessage);
            _waiting = false;
            setState(() {});
          },
          saved: (location) {
            Navigator.of(context).pop(location);
          },
        );
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: Helpers.unfocused,
            child: AppScaffold(
              notifications: _notifications,
              body: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _dictionary.setLocation,
                            textAlign: TextAlign.start,
                            style: _theme.textTheme.headline6,
                          ),
                          CupertinoButton(
                            minSize: 0,
                            padding: EdgeInsets.zero,
                            onPressed: Navigator.of(context).pop,
                            child: Text(
                              _dictionary.back,
                              style: _theme.textTheme.headline6?.copyWith(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AppTextField(
                        controller: _cityController,
                        hintText: _dictionary.locationHint,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            onChange(
                              context.read<LocationCubit>(),
                              value,
                            );
                          } else {
                            _notificationsRemove(_serverMessage);
                            setState(() => _values = []);
                          }
                        },
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: AppColors.hintTextColor.withOpacity(.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: _remote
                            ? null
                            : () => onTapToCurrent(
                                  context.read<LocationCubit>(),
                                ),
                        child: Text(
                          _remote
                              ? _dictionary.locationResourceChanged
                              : _dictionary.locationResourceChange,
                          style: _theme.textTheme.headline6?.copyWith(
                            color: _remote
                                ? AppColors.hintTextColor.withOpacity(.5)
                                : AppColors.orange,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: AppColors.hintTextColor.withOpacity(.2),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _values.length,
                        itemBuilder: (context, index) => LocationListTile(
                          press: _waiting
                              ? null
                              : () => _onTapLocation(
                                  context.read<LocationCubit>(), index),
                          location: _values[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_waiting) const AppLoader(),
        ],
      ),
    );
  }

  void onChange(LocationCubit cubit, String value) {
    cubit.add(LocationEventGet(value, _remote));
  }

  void onTapToCurrent(LocationCubit cubit) {
    _remote = true;
    if (_cityController.text.isEmpty) {
      setState(() {});
      return;
    }
    cubit.add(LocationEventGet(_cityController.text, _remote));
  }

  void _onTapLocation(LocationCubit cubit, int index) {
    Helpers.unfocused();
    if (_remote) {
      final location = _values[index];
      cubit.add(LocationEventSave(location.lat ?? '', location.lon ?? ''));
    } else {
      Navigator.of(context).pop(_values[index]);
    }
  }

  void _notificationsUpdate(String message) {
    if (!_notifications.value.contains(message)) {
      _notifications.value.add(message);
      _notifications.value = _notifications.value.map((e) => e).toList();
    }
  }

  void _notificationsRemove(String message) {
    if (_notifications.value.contains(message)) {
      _notifications.value.remove(message);
      _notifications.value = _notifications.value.map((e) => e).toList();
    }
  }
}
