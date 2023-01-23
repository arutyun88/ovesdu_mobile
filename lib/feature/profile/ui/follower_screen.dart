import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/profile_repository.dart';
import '../domain/state/user_blocked/user_blocked_cubit.dart';
import '../domain/state/user_profile_follower/my_followers_cubit.dart';
import '../domain/state/user_profile_follower/user_profile_follower_cubit.dart';
import 'components/follow_list.dart';
import 'components/profile_app_bar.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({
    Key? key,
    required this.receivedUser,
    required this.clickedIsFollowers,
    required this.followers,
    required this.following,
  }) : super(key: key);

  final UserProfileEntity receivedUser;
  final bool clickedIsFollowers;
  final List<int> followers;
  final List<int> following;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileFollowersCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserBlockedCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => MyFollowersCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
      ],
      child: _FollowerScreen(
        receivedUser: receivedUser,
        clickedIsFollowers: clickedIsFollowers,
        followers: followers,
        following: following,
      ),
    );
  }
}

class _FollowerScreen extends StatefulWidget {
  const _FollowerScreen({
    Key? key,
    required this.receivedUser,
    required this.clickedIsFollowers,
    required this.followers,
    required this.following,
  }) : super(key: key);

  final UserProfileEntity receivedUser;
  final bool clickedIsFollowers;
  final List<int> followers;
  final List<int> following;

  @override
  State<_FollowerScreen> createState() => _FollowerScreenState();
}

class _FollowerScreenState extends State<_FollowerScreen> {
  late ThemeData theme;
  late AppLocalizations dictionary;

  late int currentPage;
  late PageController pageController;

  final double appBarHeight = 120.0;
  final double tabHeight = 50.0;
  late double bodyHeight;

  @override
  void initState() {
    super.initState();
    currentPage = widget.clickedIsFollowers ? 0 : 1;
    pageController = PageController(initialPage: currentPage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
    dictionary = AppLocalizations.of(context)!;

    context
        .read<UserProfileFollowersCubit>()
        .getUserProfileFollowers(widget.followers, widget.following);
    context.read<MyFollowersCubit>().getMyFollowersIds();
    context.read<UserBlockedCubit>().getBlockedIds();

    bodyHeight = MediaQuery.of(context).size.height - appBarHeight - tabHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: widget.receivedUser.username,
            child: ProfileAppBar(
              receivedUser: widget.receivedUser,
              height: appBarHeight,
            ),
          ),
          BlocBuilder<MyFollowersCubit, MyFollowersState>(
            builder: (context, myFollowersState) => myFollowersState.maybeWhen(
              received: (myFollowers) {
                return BlocBuilder<UserBlockedCubit, UserBlockedState>(
                  builder: (context, blockedState) => blockedState.maybeWhen(
                    received: (blackList) {
                      return BlocBuilder<UserProfileFollowersCubit,
                          UserProfileFollowersState>(
                        builder: (context, state) => state.maybeWhen(
                          received: (follow) {
                            final followersKey =
                                AppLocalizations.of(context)!.followers;
                            final followingKey =
                                AppLocalizations.of(context)!.following;

                            List<Map<String, Widget>>? pages = [
                              {
                                followersKey: FollowList(
                                  height: bodyHeight,
                                  itemsKey: followersKey,
                                  items: follow.followers,
                                  myFollowers: myFollowers,
                                  blackList: blackList,
                                ),
                              },
                              {
                                followingKey: FollowList(
                                  height: bodyHeight,
                                  itemsKey: followingKey,
                                  items: follow.following,
                                  myFollowers: myFollowers,
                                  blackList: blackList,
                                ),
                              },
                            ];

                            return Column(
                              children: [
                                SizedBox(
                                  height: tabHeight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: List.generate(
                                      pages.length,
                                      (index) => GestureDetector(
                                        onTap: () => _changePage(index),
                                        child: _TabButtonItem(
                                          title: pages[index].keys.first,
                                          index: index,
                                          currentPage: currentPage,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: SizedBox(
                                    height: bodyHeight,
                                    child: PageView.builder(
                                      controller: pageController,
                                      onPageChanged: (index) =>
                                          setState(() => currentPage = index),
                                      itemCount: pages.length,
                                      itemBuilder: (context, index) =>
                                          pages[index].values.first,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          error: (error) => _ErrorWidget(error.message),
                          orElse: () => const CircularProgressIndicator(),
                        ),
                      );
                    },
                    error: (error) => _ErrorWidget(error.message),
                    orElse: () => const CircularProgressIndicator(),
                  ),
                );
              },
              error: (error) => _ErrorWidget(error.message),
              orElse: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  void _changePage(int index) {
    currentPage = index;
    pageController.animateToPage(
      currentPage,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget(
    this.message, {
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Text(
          message,
          style: theme.textTheme.headline6?.copyWith(
            color: AppColors.hintTextColor,
          ),
        ),
      ),
    );
  }
}

class _TabButtonItem extends StatelessWidget {
  const _TabButtonItem({
    Key? key,
    required this.title,
    required this.index,
    required this.currentPage,
  }) : super(key: key);

  final String title;
  final int index;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<ThemeProvider>(context).themeData.textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: theme?.apply(
          color:
              currentPage == index ? theme.color : theme.color?.withOpacity(.6),
        ),
      ),
    );
  }
}
