import 'package:domain/entity/messages_type.dart';
import 'package:flutter/material.dart';

import '../../../app/ui/config/app_colors.dart';
import '../../main/ui/components/main_app_bar_submenu_widget.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({
    Key? key,
    required this.appBarSubmenuHeight,
    required this.selectedMessagesType,
    required this.changeMessagePage,
  }) : super(key: key);

  final double appBarSubmenuHeight;

  final int selectedMessagesType;
  final Function(int) changeMessagePage;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late PageController messagePageController;

  GlobalKey messageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    messagePageController = PageController(
      initialPage: widget.selectedMessagesType,
    );
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
          typeValues: MessagesType.values.map((e) => e.name).toList(),
          selectedType: widget.selectedMessagesType,
          selectedTypeOnTap: _selectedMessagesTypeOnTap,
        ),
        Expanded(
          child: PageView(
            controller: messagePageController,
            onPageChanged: widget.changeMessagePage,
            children: [
              ListView(
                key: PageStorageKey<String>(MessagesType.private.name),
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    width: MediaQuery.of(context).size.width,
                    color:
                        index % 2 == 0 ? AppColors.greenLight : AppColors.blue,
                    child: Text('${MessagesType.private}: $index'),
                  ),
                ),
              ),
              ListView(
                key: PageStorageKey<String>(MessagesType.group.name),
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0 ? AppColors.red : AppColors.purple,
                    child: Text('${MessagesType.group}: $index'),
                  ),
                ),
              ),
              ListView(
                key: PageStorageKey<String>(MessagesType.archive.name),
                padding: EdgeInsets.zero,
                children: List.generate(
                  30,
                  (index) => Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    width: MediaQuery.of(context).size.width,
                    color: index % 2 == 0 ? AppColors.orange : AppColors.green,
                    child: Text('${MessagesType.archive}: $index'),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
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
