import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/domain/entities/post_entity/posts_entity.dart';
import '../../messages/ui/messages_screen.dart';
import '../../posts/domain/entity/messages_type.dart';
import '../../posts/domain/entity/timeline_type.dart';
import '../../posts/domain/post_repository.dart';
import '../../posts/domain/state/post_cubit.dart';
import '../../posts/ui/posts_screen.dart';
import '../../profile/domain/state/profile_cubit.dart';
import '../../profile/ui/user_screen.dart';
import 'components/main_app_bar_widget.dart';
import 'components/tab_bar_page_widget.dart';

const _home = 'home';
const _messages = 'messages';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(locator.get<PostRepository>()),
      child: const _MainScreen(),
    );
  }
}

class _MainScreen extends StatefulWidget {
  const _MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  late ThemeData theme;
  int selectedPage = 0;
  String title = _home;

  final double appBarHeight = 42.0;
  final double appBarSubmenuHeight = 48.0;
  final double tabBarHeight = 42.0;

  late double availableHeight;

  final List<TimelineType> timelineTypeValues = [
    TimelineType.overall,
    TimelineType.tags,
    TimelineType.my,
    TimelineType.subscribe,
    TimelineType.hot,
  ];

  PostsEntity? overallReceived;
  PostsEntity? tagsReceived;
  PostsEntity? myReceived;
  PostsEntity? subscribeReceived;
  PostsEntity? hotReceived;

  int selectedTimelinesType = 0;

  final List<MessagesType> messagesTypeValues = [
    MessagesType.private,
    MessagesType.group,
    MessagesType.archive,
  ];

  int selectedMessagesType = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();

    for (TimelineType type in timelineTypeValues) {
      context.read<PostCubit>().getUserPosts(
            type: TimelineType.values
                .firstWhere((element) => element.name == type.name),
            limit: 10,
            last: 0,
          );
    }
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
          Expanded(
            child: selectedPage == 0
                ? BlocListener<PostCubit, PostState>(
                    listener: (context, state) => state.whenOrNull(
                      overall: (received) => setState(
                        () => overallReceived = received,
                      ),
                      tags: (received) => setState(
                        () => tagsReceived = received,
                      ),
                      my: (received) => setState(
                        () => myReceived = received,
                      ),
                      subscribe: (received) => setState(
                        () => subscribeReceived = received,
                      ),
                      hot: (received) => setState(
                        () => hotReceived = received,
                      ),
                    ),
                    child: PostsScreen(
                      appBarSubmenuHeight: appBarSubmenuHeight,
                      overallReceived: overallReceived,
                      tagsReceived: tagsReceived,
                      myReceived: myReceived,
                      subscribeReceived: subscribeReceived,
                      hotReceived: hotReceived,
                      selectedTimelinesType: selectedTimelinesType,
                      changeTimelinePage: _changeTimelinePage,
                    ),
                  )
                : MessagesScreen(
                    appBarSubmenuHeight: appBarSubmenuHeight,
                    selectedMessagesType: selectedMessagesType,
                    changeMessagePage: _changeMessagePage,
                  ),
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
        selectedPage = 0;
        title = _home;
      });
    } else if (index == 1) {
      setState(() {
        selectedPage = 1;
        title = _messages;
      });
    } else if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserScreen(),
        ),
      );
    }
  }

  void _changeTimelinePage(int id) {
    setState(() {
      selectedTimelinesType = id;
    });
  }

  void _changeMessagePage(int id) {
    setState(() {
      selectedMessagesType = id;
    });
  }
}
