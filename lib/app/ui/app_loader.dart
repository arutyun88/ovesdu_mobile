import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/data/setting_provider/theme_provider.dart';
import 'package:provider/provider.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Provider.of<ThemeProvider>(context)
          .themeData
          .backgroundColor
          .withOpacity(.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
