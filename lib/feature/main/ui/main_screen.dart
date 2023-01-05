import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import 'components/main_app_bar_submenu_widget.dart';
import 'components/main_body_widget.dart';
import '../../profile/domain/state/profile_cubit.dart';
import '../../profile/ui/user_screen.dart';
import 'components/main_app_bar_widget.dart';
import 'components/tab_bar_page_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> timelineTypeValues = [
    'overall',
    'tags',
    'my',
    'subscribe',
    'hot',
  ];
  final List<String> messagesTypeValues = [
    'private',
    'group',
    'archive',
  ];

  late ThemeData theme;
  int selectedPage = 0;
  String title = 'home';

  int selectedMessagesType = 0;
  int selectedTimelinesType = 0;

  final double appBarHeight = 42.0;
  final double appBarSubmenuHeight = 48.0;
  final double tabBarHeight = 42.0;

  late double availableHeight;

  late PageController timelinePageController;
  late PageController messagePageController;

  GlobalKey timelineKey = GlobalKey();
  GlobalKey messageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
    timelinePageController = PageController(initialPage: selectedMessagesType);
    messagePageController = PageController(initialPage: selectedTimelinesType);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
    availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        appBarHeight -
        appBarSubmenuHeight -
        tabBarHeight;
  }

  @override
  void dispose() {
    timelinePageController.dispose();
    messagePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainAppBarWidget(
            appBarHeight: appBarHeight,
            title: title,
          ),
          selectedPage == 0
              ? MainAppBarSubmenuWidget(
                  appBarSubmenuHeight: appBarSubmenuHeight,
                  typeValues: timelineTypeValues,
                  selectedType: selectedTimelinesType,
                  selectedTypeOnTap: _selectedTimelineTypeOnTap,
                )
              : MainAppBarSubmenuWidget(
                  appBarSubmenuHeight: appBarSubmenuHeight,
                  typeValues: messagesTypeValues,
                  selectedType: selectedMessagesType,
                  selectedTypeOnTap: _selectedMessagesTypeOnTap,
                ),
          selectedPage == 0
              ? MainBodyWidget(
                  key: timelineKey,
                  typeValues: timelineTypeValues,
                  pageController: timelinePageController,
                  onPageChange: _changeTimelinePage,
                )
              : MainBodyWidget(
                  key: messageKey,
                  typeValues: messagesTypeValues,
                  pageController: messagePageController,
                  onPageChange: _changeMessagePage,
                ),
          TabBarPageWidget(
            tabBarHeight: tabBarHeight,
            selectedPage: selectedPage,
            tabBarItemOnTap: _tabBarItemOnTap,
          ),
        ],
      ),
    );
  }

  void _tabBarItemOnTap(int index) {
    if (index == 0) {
      setState(() {
        _changeTimelinePage(timelinePageController.initialPage);
        selectedPage = 0;
        title = 'home';
      });
    } else if (index == 1) {
      setState(() {
        _changeMessagePage(messagePageController.initialPage);
        selectedPage = 1;
        title = 'messages';
      });
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserScreen(),
        ),
      );
    }
  }

  void _changeMessagePage(int id) {
    setState(() {
      selectedMessagesType = id;
    });
  }

  void _changeTimelinePage(int id) {
    setState(() {
      selectedTimelinesType = id;
    });
  }

  void _selectedTimelineTypeOnTap(int index) {
    timelinePageController.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }

  void _selectedMessagesTypeOnTap(int index) {
    messagePageController.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }
}
