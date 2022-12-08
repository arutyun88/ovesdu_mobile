import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../domain/entity/user_post/user_post_entity.dart';
import '../domain/entity/user_post_comment/user_post_comment_entity.dart';
import '../domain/entity/user_post_comment/user_post_comments_entity.dart';
import '../domain/state/user_comment_action/user_comment_action_cubit.dart';
import '../domain/state/user_post_comment/user_post_comment_cubit.dart';
import '../domain/state/user_post_cubit.dart';
import '../domain/user_post_repository.dart';
import 'components/user_comment/user_comment_field.dart';
import 'components/user_comment/user_comment_list.dart';
import 'components/user_comment/user_comment_post.dart';
import 'components/user_comment/user_comment_post_header.dart';

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
        BlocProvider(
          create: (context) => UserCommentActionCubit(
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

  late TextEditingController _commentController;

  late int symbolCount = 0;

  late UserPostEntity postEntity;

  UserPostCommentEntity? selectedComment;
  UserPostCommentEntity? editingComment;

  bool isEdit = false;

  late ScrollController scrollController;
  bool isLoading = false;
  bool hasMore = true;
  int lastComment = 0;
  UserPostCommentsEntity? postComments;

  @override
  void initState() {
    super.initState();

    _commentFieldKey = GlobalKey();
    renderBox = null;

    _commentController = TextEditingController();

    postEntity = widget.post;

    context
        .read<UserPostCubit>()
        .getUserPost(postEntity.id)
        .whenComplete(() => context
            .read<UserPostCommentCubit>()
            .getPostComments(
              postId: postEntity.id,
              limit: 10,
              last: 0,
            )
            .whenComplete(() => _setLastCommentId()));

    scrollController = ScrollController()..addListener(scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context, listen: false).themeData;
    dictionary = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostCubit, UserPostState>(
      builder: (context, state) {
        return Scaffold(
          body: GestureDetector(
            onTap: Helpers.unfocused,
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      UserCommentPostHeader(
                        postEntity: state.maybeWhen(
                          updated: (entity) => entity,
                          orElse: () => postEntity,
                        ),
                        avatar: widget.avatar,
                        lastVisit: widget.lastVisit,
                        onTapToUp: _onTapToUp,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          controller: scrollController,
                          child: Column(
                            children: [
                              UserCommentPost(
                                avatar: widget.avatar,
                                lastVisit: widget.lastVisit,
                                post: postEntity,
                              ),
                              UserCommentList(
                                onTapToSelect: _onTapToSelect,
                                onTapToRead: _onTapToRead,
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
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, -1),
                            blurRadius: 1.0,
                            color:
                                Theme.of(context).shadowColor.withOpacity(.2),
                          ),
                        ],
                      ),
                      key: _commentFieldKey,
                      child: UserCommentField(
                        controller: _commentController,
                        onChanged: _fieldOnChanged,
                        sendOnPressed: _sendOnPressed,
                        actionHeight: actionHeight,
                        symbolCount: symbolCount,
                        replyToComment: selectedComment,
                        onTapToUnselect: _onTapToSelect,
                        isEdit: isEdit,
                        onTapToCancel: _onTapToCancel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * .80 &&
        !isLoading) {
      if (hasMore) {
        addComments();
      }
    }
  }

  void addComments() async {
    isLoading = true;

    await context
        .read<UserPostCommentCubit>()
        .addPostComments(
          postId: postEntity.id,
          limit: 20,
          last: postComments?.last ?? 0,
        )
        .then((value) => _setLastCommentId());
    isLoading = false;
  }

  void _setLastCommentId() {
    context.read<UserPostCommentCubit>().state.whenOrNull(received: (comments) {
      postComments = comments;
      hasMore = (postComments?.comments.length ?? 0) < postEntity.comment;
    });
  }

  void _onTapToSelect(UserPostCommentEntity? selected) {
    setState(() {
      selectedComment = selected;
    });
  }

  void _onTapToCancel() {
    setState(() {
      editingComment = null;
      isEdit = false;
    });
  }

  void _onTapToRead(
      UserPostCommentEntity comment, UserPostCommentEntity? replyTo) {
    setState(() {
      _commentController.text = comment.text ?? '';
      editingComment = comment;
      selectedComment = replyTo;
      isEdit = true;
    });
  }

  void _onTapToUp() => scrollController.animateTo(0.0,
      duration: kThemeAnimationDuration, curve: Curves.ease);

  void _fieldOnChanged(value) {
    final renderBox =
        _commentFieldKey.currentContext!.findRenderObject() as RenderBox;
    setState(
      () {
        symbolCount = value.trim().length;
        fieldHeight = renderBox.size.height;
      },
    );
  }

  void _sendOnPressed() {
    final value = _commentController.text.trim();
    if (value.isNotEmpty) {
      if (editingComment != null) {
        CustomDialog.showConfirmMessageDialog(
          context,
          dictionary.confirmCommentUpdating,
        ).then((value) {
          if (value != null && value == true) {
            context
                .read<UserCommentActionCubit>()
                .updateComment(
                  commentId: editingComment?.id ?? -1,
                  postId: postEntity.id,
                  text: _commentController.text.trim(),
                  toCommentId: selectedComment?.id,
                )
                .then(
              (value) {
                context.read<UserCommentActionCubit>().state.whenOrNull(
                  updated: (updatedComment) {
                    return CustomDialog.showMessageDialog(
                      context,
                      dictionary.commentUpdated,
                    ).whenComplete(
                      () {
                        selectedComment = null;
                        editingComment = null;
                        _commentController.clear();
                        _fieldOnChanged(_commentController.text);
                        Helpers.unfocused();
                        context
                            .read<UserPostCommentCubit>()
                            .commentUpdated(updatedComment);
                      },
                    );
                  },
                  error: (error) {
                    return CustomDialog.showErrorDialog(context, error.message);
                  },
                );
              },
            );
          }
        });
      } else {
        context
            .read<UserCommentActionCubit>()
            .createComment(
              postId: postEntity.id,
              text: _commentController.text.trim(),
              toCommentId: selectedComment?.id,
            )
            .then(
          (value) {
            context.read<UserCommentActionCubit>().state.whenOrNull(
              created: (newComment) {
                return CustomDialog.showMessageDialog(
                  context,
                  dictionary.commentPublished,
                ).whenComplete(
                  () {
                    selectedComment = null;
                    _commentController.clear();
                    _fieldOnChanged(_commentController.text);
                    Helpers.unfocused();
                    context
                        .read<UserPostCommentCubit>()
                        .commentAdded(newComment);
                    context
                        .read<UserPostCubit>()
                        .updateComments(ActionType.add);
                    postEntity = context.read<UserPostCubit>().state.maybeWhen(
                          updated: (entity) => entity,
                          orElse: () => postEntity,
                        );
                  },
                );
              },
              error: (error) {
                return CustomDialog.showErrorDialog(context, error.message);
              },
            );
          },
        );
      }
    } else {
      CustomDialog.showMessageDialog(
        context,
        dictionary.commentCannotBeEmpty,
      ).whenComplete(() => _commentController.clear());
    }
  }
}
