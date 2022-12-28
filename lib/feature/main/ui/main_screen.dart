import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../posts/ui/posts_screen.dart';
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
  late int selectedTimelinesType = 0;
  late int selectedMessagesType = 0;
  late ThemeData theme;
  int selectedPage = 0;
  String title = 'home';

  final double appBarHeight = 42.0;
  final double appBarSubmenuHeight = 48.0;
  final double tabBarHeight = 42.0;

  late double availableHeight;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainAppBarWidget(
            selectedPage: selectedPage,
            appBarHeight: appBarHeight,
            appBarSubmenuHeight: appBarSubmenuHeight,
            title: title,
            selectedMessagesTypeOnTap: _selectedMessagesTypeOnTap,
            selectedTimelineTypeOnTap: _selectedTimelineTypeOnTap,
            messagesTypeValues: messagesTypeValues,
            timelineTypeValues: timelineTypeValues,
            selectedTimelinesType: selectedTimelinesType,
            selectedMessagesType: selectedMessagesType,
          ),
          const Expanded(child: PostsScreen()),
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
        selectedPage = 0;
        title = 'home';
      });
    } else if (index == 1) {
      setState(() {
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

  void _selectedTimelineTypeOnTap(int id) {
    setState(() {
      selectedTimelinesType = id;
    });
  }

  void _selectedMessagesTypeOnTap(int id) {
    setState(() {
      selectedMessagesType = id;
    });
  }
}
