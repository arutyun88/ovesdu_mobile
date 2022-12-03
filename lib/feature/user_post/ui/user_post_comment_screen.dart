import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/text_fields/app_multiline_text_field.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entity/user_post/user_post_entity.dart';
import 'components/user_post_item/user_post_item_content.dart';
import 'components/user_post_item/user_post_item_header.dart';
import 'components/user_post_item_statistic/user_post_item_statistic.dart';

class UserPostCommentScreen extends StatefulWidget {
  const UserPostCommentScreen({
    Key? key,
    required this.avatar,
    required this.post,
    required this.lastVisit,
  }) : super(key: key);
  final String? avatar;
  final DateTime lastVisit;
  final UserPostEntity post;

  @override
  State<UserPostCommentScreen> createState() => _UserPostCommentScreenState();
}

class _UserPostCommentScreenState extends State<UserPostCommentScreen> {
  late double fieldHeight = 80.0;
  late double actionHeight = 48.0;
  late ThemeData theme;
  late GlobalKey _commentFieldKey;
  late RenderBox? renderBox;

  @override
  void initState() {
    super.initState();

    _commentFieldKey = GlobalKey();
    renderBox = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: Helpers.unfocused,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: theme.backgroundColor,
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 24,
                            color: AppColors.orange,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          child: UserPostItemHeader(
                            avatar: widget.avatar,
                            firstName: widget.post.author.firstName,
                            lastName: widget.post.author.lastName,
                            created: widget.post.created,
                            updated: widget.post.updated,
                            lastVisit: widget.lastVisit,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Hero(
                            transitionOnUserGestures: true,
                            tag: '${widget.post.id}:'
                                '${widget.post.author.lastName}.'
                                '${widget.post.author.firstName}',
                            child: Column(
                              children: [
                                UserPostItemContent(
                                  post: widget.post,
                                  isCommentScreen: true,
                                ),
                                UserPostItemStatistic(
                                  avatar: widget.avatar,
                                  post: widget.post,
                                  lastVisit: widget.lastVisit,
                                  isCommentScreen: true,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: List.generate(
                              10,
                              (index) => Container(
                                height: 100,
                                color: index % 2 == 0
                                    ? AppColors.red
                                    : AppColors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: fieldHeight + actionHeight),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                child: SizedBox(
                  key: _commentFieldKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: theme.backgroundColor,
                        padding: const EdgeInsets.all(verticalPadding),
                        child: AppMultilineTextField(
                          maxLines: 7,
                          onChanged: (value) {
                            renderBox ??= _commentFieldKey.currentContext!
                                .findRenderObject() as RenderBox;
                            setState(() {
                              fieldHeight = 30 + (renderBox?.size.height ?? 0);
                            });
                          },
                        ),
                      ),
                      Container(
                        color: theme.backgroundColor,
                        height: actionHeight,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: mainPadding,
                        ),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.send,
                            size: iconSize,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
