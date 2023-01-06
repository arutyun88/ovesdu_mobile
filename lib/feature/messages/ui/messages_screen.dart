import 'package:flutter/material.dart';

import '../../main/ui/components/main_app_bar_submenu_widget.dart';
import '../../main/ui/components/main_body_widget.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({
    Key? key,
    required this.appBarSubmenuHeight,
  }) : super(key: key);

  final double appBarSubmenuHeight;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<String> messagesTypeValues = [
    'private',
    'group',
    'archive',
  ];

  late PageController messagePageController;

  int selectedMessagesType = 0;
  GlobalKey messageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    messagePageController = PageController(initialPage: selectedMessagesType);
  }

  @override
  void dispose() {
    messagePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppBarSubmenuWidget(
          appBarSubmenuHeight: widget.appBarSubmenuHeight,
          typeValues: messagesTypeValues,
          selectedType: selectedMessagesType,
          selectedTypeOnTap: _selectedMessagesTypeOnTap,
        ),
        MainBodyWidget(
          key: messageKey,
          typeValues: messagesTypeValues,
          pageController: messagePageController,
          onPageChange: _changeMessagePage,
        ),
      ],
    );
  }

  void _changeMessagePage(int id) {
    setState(() {
      selectedMessagesType = id;
    });
  }

  void _selectedMessagesTypeOnTap(int index) {
    messagePageController.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }
}
