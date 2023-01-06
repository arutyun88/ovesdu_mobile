import 'package:flutter/material.dart';

import '../../main/ui/components/main_app_bar_submenu_widget.dart';
import '../../main/ui/components/main_body_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({
    Key? key,
    required this.appBarSubmenuHeight,
  }) : super(key: key);

  final double appBarSubmenuHeight;

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final List<String> timelineTypeValues = [
    'overall',
    'tags',
    'my',
    'subscribe',
    'hot',
  ];

  late PageController timelinePageController;

  int selectedTimelinesType = 0;
  GlobalKey timelineKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    timelinePageController = PageController(initialPage: selectedTimelinesType);
  }

  @override
  void dispose() {
    timelinePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppBarSubmenuWidget(
          appBarSubmenuHeight: widget.appBarSubmenuHeight,
          typeValues: timelineTypeValues,
          selectedType: selectedTimelinesType,
          selectedTypeOnTap: _selectedTimelineTypeOnTap,
        ),
        MainBodyWidget(
          key: timelineKey,
          typeValues: timelineTypeValues,
          pageController: timelinePageController,
          onPageChange: _changeTimelinePage,
        ),
      ],
    );
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
}
