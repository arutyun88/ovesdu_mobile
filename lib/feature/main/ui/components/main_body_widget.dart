import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../../app/ui/config/app_colors.dart';
import 'main_app_bar_submenu_widget.dart';

class MainBodyWidget extends StatefulWidget {
  const MainBodyWidget({
    Key? key,
    required this.selectedPage,
    required this.appBarSubmenuHeight,
    required this.timelineTypeValues,
    required this.messagesTypeValues,
  }) : super(key: key);

  final int selectedPage;
  final double appBarSubmenuHeight;
  final List<String> timelineTypeValues;
  final List<String> messagesTypeValues;

  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  late ThemeData theme;
  late PageController _postPageController;
  late ScrollController _overallScrollController;
  late ScrollController _tagsScrollController;
  late ScrollController _myScrollController;
  late ScrollController _subscribeScrollController;
  late ScrollController _hotScrollController;

  final PageStorageKey _overallKey = const PageStorageKey<String>('overall');
  final PageStorageKey _tagsKey = const PageStorageKey<String>('tags');
  final PageStorageKey _myKey = const PageStorageKey<String>('my');
  final PageStorageKey _subscribeKey =
      const PageStorageKey<String>('subscribe');
  final PageStorageKey _hotKey = const PageStorageKey<String>('hot');

  int selectedMessagesType = 0;
  int selectedTimelinesType = 0;

  @override
  void initState() {
    super.initState();
    _postPageController = PageController(initialPage: 0);
    _overallScrollController = ScrollController();
    _tagsScrollController = ScrollController();
    _myScrollController = ScrollController();
    _subscribeScrollController = ScrollController();
    _hotScrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppBarSubmenuWidget(
          selectedPage: widget.selectedPage,
          appBarSubmenuHeight: widget.appBarSubmenuHeight,
          selectedMessagesTypeOnTap: _selectedMessagesTypeOnTap,
          selectedTimelineTypeOnTap: _selectedTimelineTypeOnTap,
          messagesTypeValues: widget.messagesTypeValues,
          timelineTypeValues: widget.timelineTypeValues,
          selectedTimelinesType: selectedTimelinesType,
          selectedMessagesType: selectedMessagesType,
        ),
        Expanded(
          child: PageView(
            controller: _postPageController,
            children: [
              ListView(
                key: _overallKey,
                controller: _overallScrollController,
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0 ? AppColors.red : AppColors.purple,
                    child: Text(index.toString()),
                  ),
                ),
              ),
              ListView(
                key: _tagsKey,
                controller: _tagsScrollController,
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0 ? AppColors.green : AppColors.orange,
                    child: Text(index.toString()),
                  ),
                ),
              ),
              ListView(
                key: _myKey,
                controller: _myScrollController,
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0
                        ? AppColors.greenLight
                        : AppColors.hintTextColor,
                    child: Text(index.toString()),
                  ),
                ),
              ),
              ListView(
                key: _subscribeKey,
                controller: _subscribeScrollController,
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0 ? AppColors.green : AppColors.orange,
                    child: Text(index.toString()),
                  ),
                ),
              ),
              ListView(
                key: _hotKey,
                controller: _hotScrollController,
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0 ? AppColors.blueLight : AppColors.red,
                    child: Text(index.toString()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _selectedMessagesTypeOnTap(int id) {
    setState(() {
      selectedMessagesType = id;
    });
  }

  void _selectedTimelineTypeOnTap(int id) {
    setState(() {
      selectedTimelinesType = id;
    });
  }
}
