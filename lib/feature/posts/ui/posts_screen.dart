import 'package:flutter/material.dart';

import '../../../app/domain/entities/post_entity/post_entity.dart';
import '../../../app/domain/entities/post_entity/posts_entity.dart';
import '../../../app/ui/config/app_colors.dart';
import '../../main/ui/components/main_app_bar_submenu_widget.dart';
import '../../../app/ui/components/post/post_content.dart';
import '../domain/entity/timeline_type.dart';
import '../../../app/ui/components/post/post_header.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({
    Key? key,
    required this.appBarSubmenuHeight,
    this.overallReceived,
    this.tagsReceived,
    this.myReceived,
    this.subscribeReceived,
    this.hotReceived,
    required this.selectedTimelinesType,
    required this.changeTimelinePage,
  }) : super(key: key);

  final double appBarSubmenuHeight;

  final PostsEntity? overallReceived;
  final PostsEntity? tagsReceived;
  final PostsEntity? myReceived;
  final PostsEntity? subscribeReceived;
  final PostsEntity? hotReceived;

  final int selectedTimelinesType;
  final Function(int) changeTimelinePage;

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late PageController timelinePageController;

  GlobalKey timelineKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    timelinePageController = PageController(
      initialPage: widget.selectedTimelinesType,
    );
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
          typeValues: TimelineType.values.map((e) => e.name).toList(),
          selectedType: widget.selectedTimelinesType,
          selectedTypeOnTap: _selectedTimelineTypeOnTap,
        ),
        Expanded(
          child: PageView(
            controller: timelinePageController,
            onPageChanged: widget.changeTimelinePage,
            children: [
              widget.overallReceived != null
                  ? ListView(
                      key: PageStorageKey<String>(TimelineType.overall.name),
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        widget.overallReceived!.posts.length,
                        (index) => Column(
                          children: [
                            PostHeader(
                              post: widget.overallReceived!.posts[index],
                              onTapToRead: (PostEntity entity) {},
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PostContent(
                                  post: widget.overallReceived!.posts[index],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
              widget.tagsReceived != null
                  ? ListView(
                      key: PageStorageKey<String>(TimelineType.tags.name),
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        30,
                        (index) => Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          width: MediaQuery.of(context).size.width,
                          color:
                              index % 2 == 0 ? AppColors.red : AppColors.purple,
                          child: Text('${TimelineType.tags}: $index'),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
              widget.myReceived != null
                  ? ListView(
                      key: PageStorageKey<String>(TimelineType.my.name),
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        30,
                        (index) => Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          width: MediaQuery.of(context).size.width,
                          color:
                              index % 2 == 0 ? AppColors.red : AppColors.purple,
                          child: Text('${TimelineType.my}: $index'),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
              widget.subscribeReceived != null
                  ? ListView(
                      key: PageStorageKey<String>(TimelineType.subscribe.name),
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        30,
                        (index) => Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          width: MediaQuery.of(context).size.width,
                          color:
                              index % 2 == 0 ? AppColors.red : AppColors.purple,
                          child: Text('${TimelineType.subscribe}: $index'),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
              widget.hotReceived != null
                  ? ListView(
                      key: PageStorageKey<String>(TimelineType.hot.name),
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        30,
                        (index) => Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          width: MediaQuery.of(context).size.width,
                          color:
                              index % 2 == 0 ? AppColors.red : AppColors.purple,
                          child: Text('${TimelineType.hot}: $index'),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  void _selectedTimelineTypeOnTap(int index) {
    timelinePageController.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }
}
