import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/buttons/empty_button.dart';
import '../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../../../app/ui/components/text_fields/app_multiline_text_field.dart';
import '../../../app/ui/config/app_colors.dart';
import '../domain/entity/user_post/user_post_entity.dart';
import '../domain/state/user_post_comment/user_post_comment_cubit.dart';
import '../domain/state/user_post_cubit.dart';
import '../domain/user_post_repository.dart';
import 'components/user_post_item/user_post_item_content.dart';
import 'components/user_post_item/user_post_item_header.dart';
import 'components/user_post_item_statistic/user_post_item_statistic.dart';

class UserPostCommentScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserPostCommentCubit(
            locator.get<UserPostRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserPostCubit(
            locator.get<UserPostRepository>(),
          ),
        ),
      ],
      child: _UserPostCommentScreen(
        avatar: avatar,
        post: post,
        lastVisit: lastVisit,
      ),
    );
  }
}

class _UserPostCommentScreen extends StatefulWidget {
  const _UserPostCommentScreen({
    Key? key,
    required this.avatar,
    required this.post,
    required this.lastVisit,
  }) : super(key: key);
  final String? avatar;
  final DateTime lastVisit;
  final UserPostEntity post;

  @override
  State<_UserPostCommentScreen> createState() => _UserPostCommentScreenState();
}

class _UserPostCommentScreenState extends State<_UserPostCommentScreen> {
  late double actionHeight = 48.0;
  late double fieldHeight = 80.0 + actionHeight;
  late ThemeData theme;
  late AppLocalizations dictionary;
  late GlobalKey _commentFieldKey;
  late RenderBox? renderBox;

  late TextEditingController _newCommentController;

  late int symbolCount = 0;

  late UserPostEntity postEntity;

  @override
  void initState() {
    super.initState();

    _commentFieldKey = GlobalKey();
    renderBox = null;

    _newCommentController = TextEditingController();

    postEntity = widget.post;

    context.read<UserPostCubit>().getUserPost(postEntity.id).whenComplete(() {
      context.read<UserPostCommentCubit>().getPostComments(
            postId: postEntity.id,
            limit: 20,
            last: 0,
          );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
    dictionary = AppLocalizations.of(context)!;
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
                  Material(
                    elevation: 1,
                    child: Container(
                      color: theme.backgroundColor,
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(postEntity),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: iconSize,
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
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BlocListener<UserPostCubit, UserPostState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                updated: (entity) {
                                  setState(() {
                                    postEntity = entity;
                                  });
                                },
                              );
                            },
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: '${widget.post.id}:'
                                  '${widget.post.author.lastName}.'
                                  '${widget.post.author.firstName}',
                              child: Column(
                                children: [
                                  UserPostItemContent(
                                    post: postEntity,
                                    isCommentScreen: true,
                                  ),
                                  UserPostItemStatistic(
                                    avatar: widget.avatar,
                                    post: postEntity,
                                    lastVisit: widget.lastVisit,
                                    isCommentScreen: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: verticalPadding,
                            color: AppColors.hintTextColor.withOpacity(.1),
                          ),
                          BlocBuilder<UserPostCommentCubit,
                              UserPostCommentState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                received: (comments) {
                                  return Column(
                                    children: List.generate(
                                      comments.comments.length,
                                      (index) => Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: verticalPadding,
                                          horizontal: mainPadding,
                                        ),
                                        child: Text(
                                          comments.comments[index].text ?? '',
                                          style: theme.textTheme.bodyText1,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                orElse: () => Column(
                                  children: List.generate(
                                    3,
                                    (index) => Container(
                                      height: 100,
                                      width: 100,
                                      color: AppColors.hintTextColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: fieldHeight),
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
                          hintText: dictionary.commentHint,
                          maxLines: 7,
                          controller: _newCommentController,
                          onChanged: (value) {
                            final renderBox = _commentFieldKey.currentContext!
                                .findRenderObject() as RenderBox;
                            setState(() {
                              symbolCount = value.trim().length;
                              fieldHeight = renderBox.size.height;
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: symbolCount != 0
                                  ? Text(
                                      '$symbolCount ${dictionary.symbols}',
                                      style:
                                          theme.textTheme.bodyText2?.copyWith(
                                        color: AppColors.hintTextColor,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    )
                                  : Text(
                                      dictionary.commentReply,
                                      maxLines: 2,
                                      style:
                                          theme.textTheme.bodyText2?.copyWith(
                                        color: AppColors.hintTextColor,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: mainPadding),
                              child: EmptyButton(
                                onPressed: _sendOnPressed,
                                child: const Icon(
                                  Icons.send,
                                  size: iconSize,
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                          ],
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

  void _sendOnPressed() {
    final value = _newCommentController.text.trim();
    if (value.isNotEmpty) {
      context
          .read<UserPostCommentCubit>()
          .createPostComment(
            postId: widget.post.id,
            text: _newCommentController.text.trim(),
          )
          .then(
        (value) {
          context.read<UserPostCommentCubit>().state.whenOrNull(
              created: (newPost) {
            return CustomDialog.showMessageDialog(
              context,
              dictionary.commentPublished,
            ).whenComplete(
              () {
                _newCommentController.clear();
                Helpers.unfocused();
              },
            );
          }, error: (error) {
            return CustomDialog.showErrorDialog(context, error.message);
          });
        },
      );
    } else {
      CustomDialog.showMessageDialog(
        context,
        dictionary.commentCannotBeEmpty,
      ).whenComplete(() => _newCommentController.clear());
    }
  }
}
