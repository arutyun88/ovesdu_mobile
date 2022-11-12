import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../data/setting_provider/theme_provider.dart';
import '../../../../helpers/app_icons.dart';

const double buttonHeight = 46.0;

class ThemeButton extends StatefulWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  late ThemeProvider _themeProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeProvider = Provider.of<ThemeProvider>(context);
  }

  void _changeTheme() => _themeProvider.setTheme();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeTheme,
      child: Container(
        height: buttonHeight,
        width: buttonHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: _themeProvider.themeData.hintColor.withOpacity(.3),
          ),
        ),
        padding: _themeProvider.isLightTheme
            ? const EdgeInsets.all(6)
            : const EdgeInsets.all(8),
        child: SvgPicture.asset(
          _themeProvider.isLightTheme ? AppIcons.sunIcon : AppIcons.moonIcon,
          color: _themeProvider.themeData.textTheme.headline6?.color
              ?.withOpacity(.5),
        ),
      ),
    );
  }
}
