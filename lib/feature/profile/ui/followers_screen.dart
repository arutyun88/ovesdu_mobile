import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entities/user_profile_follower/user_profile_follower_item_entity.dart';
import '../domain/entities/user_profile_follower/user_simple_followers_entity.dart';
import '../domain/state/user_profile_follower/my_followers_cubit.dart';
import 'components/follow_list.dart';
import '../../../app/ui/components/item_divider.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({
    Key? key,
    required this.followers,
    required this.following,
    required this.clickedIsFollowers,
    required this.size,
    required this.myFollowers,
    required this.blackList,
    required this.cubit,
  }) : super(key: key);

  final List<UserProfileFollowerItemEntity> followers;
  final List<UserProfileFollowerItemEntity> following;
  final bool clickedIsFollowers;
  final Size size;
  final UserSimpleFollowersEntity? myFollowers;
  final List<int> blackList;
  final MyFollowersCubit cubit;

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  late ThemeData theme;

  late int currentPage = widget.clickedIsFollowers ? 0 : 1;
  late PageController pageController = PageController(initialPage: currentPage);

  late List<Map<String, Widget>> pages;

  late double verticalPadding;
  late double horizontalPadding;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;

    final media = MediaQuery.of(context).size;
    verticalPadding = (media.height - widget.size.height) / 2;
    horizontalPadding = (media.width - widget.size.width) / 2;

    final followersKey = AppLocalizations.of(context)!.followers;
    final followingKey = AppLocalizations.of(context)!.following;
    pages = [
      {
        followersKey: FollowList(
          itemsKey: followersKey,
          items: widget.followers,
          myFollowers: widget.myFollowers,
          blackList: widget.blackList,
        ),
      },
      {
        followingKey: FollowList(
          itemsKey: followingKey,
          items: widget.following,
          myFollowers: widget.myFollowers,
          blackList: widget.blackList,
        ),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: theme.backgroundColor.withOpacity(.95),
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(color: AppColors.hintTextColor, blurRadius: 5.0)
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  const ItemDivider(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    (verticalPadding * 2),
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) => setState(() => currentPage = index),
                  children: pages.map((page) => page.values.first).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    currentPage = index;
    pageController.animateToPage(
      index,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
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
