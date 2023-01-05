import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';

class MainBodyWidget extends StatefulWidget {
  const MainBodyWidget({
    Key? key,
    required this.typeValues,
    required this.onPageChange,
    required this.pageController,
  }) : super(key: key);

  final List<String> typeValues;
  final Function(int index) onPageChange;
  final PageController pageController;

  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: widget.pageController,
        onPageChanged: widget.onPageChange,
        children: List.generate(
          widget.typeValues.length,
          (valueIndex) => ListView(
            key: PageStorageKey<String>(widget.typeValues[valueIndex]),
            padding: EdgeInsets.zero,
            children: List.generate(
              30,
              (index) => Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width,
                color: index % 2 == 0 ? AppColors.red : AppColors.purple,
                child: Text('${widget.typeValues[valueIndex]}: $index'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
