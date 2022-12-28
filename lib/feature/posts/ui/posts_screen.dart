import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/config/app_colors.dart';
import '../../../app/ui/config/app_fonts.dart';
import '../../../app/ui/components/app_bar_logo_widget.dart';
import 'components/post_type_item.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final List<String> values = ['hot', 'subscribe', 'my', 'overall'];
  late int _selectedItem = 0;

  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            color: theme.backgroundColor,
            elevation: 4.0,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 42,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            constraints: const BoxConstraints(
                              minHeight: 0.0,
                              minWidth: 0.0,
                            ),
                            splashRadius: iconSize,
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            color: AppColors.orange,
                            iconSize: iconSize,
                            icon: const Icon(CupertinoIcons.line_horizontal_3),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                iconSize -
                                28.0,
                            child: Row(
                              children: const [
                                AppBarLogoWidget(),
                                Spacer(),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  child: Text(
                                    'home',
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.hintTextColor,
                                    ),
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.search,
                                  size: 28.0,
                                  color: AppColors.orange,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
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
                              values.length,
                              (index) => PostTypeItem(
                                value: values[index],
                                selected: _selectedItem == index,
                                onTap: () => _selectedOnTap(index),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectedOnTap(int id) {
    setState(() {
      _selectedItem = id;
    });
  }
}
