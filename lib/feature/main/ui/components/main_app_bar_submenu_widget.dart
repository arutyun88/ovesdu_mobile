import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/data/setting_provider/theme_provider.dart';
import '../../../posts/ui/components/post_type_item.dart';

class MainAppBarSubmenuWidget extends StatelessWidget {
  const MainAppBarSubmenuWidget({
    Key? key,
    required this.selectedPage,
    required this.selectedTimelinesType,
    required this.selectedMessagesType,
    required this.appBarSubmenuHeight,
    required this.timelineTypeValues,
    required this.messagesTypeValues,
    required this.selectedMessagesTypeOnTap,
    required this.selectedTimelineTypeOnTap,
  }) : super(key: key);

  final int selectedPage;
  final int selectedTimelinesType;
  final int selectedMessagesType;
  final double appBarSubmenuHeight;
  final List<String> timelineTypeValues;
  final List<String> messagesTypeValues;
  final Function(int) selectedMessagesTypeOnTap;
  final Function(int) selectedTimelineTypeOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;

    return Material(
      color: theme.backgroundColor,
      elevation: 2.0,
      child: selectedPage == 0
          ? SizedBox(
              height: appBarSubmenuHeight,
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        timelineTypeValues.length,
                        (index) => PostTypeItem(
                          value: timelineTypeValues[index],
                          selected: selectedTimelinesType == index,
                          onTap: () => selectedTimelineTypeOnTap(index),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : SizedBox(
              height: appBarSubmenuHeight,
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        messagesTypeValues.length,
                        (index) => PostTypeItem(
                          value: messagesTypeValues[index],
                          selected: selectedMessagesType == index,
                          onTap: () => selectedMessagesTypeOnTap(index),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
