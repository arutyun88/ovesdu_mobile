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

  late TextEditingController _newCommentController;

  late int symbolCount = 0;

  late UserPostEntity postEntity;

  UserPostCommentEntity? selectedComment;

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
            limit: 10,
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
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              UserCommentPost(
                                avatar: widget.avatar,
                                lastVisit: widget.lastVisit,
                                post: postEntity,
                              ),
                              UserCommentList(onTapToSelect: _onTapToSelect),
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
                        controller: _newCommentController,
                        onChanged: _fieldOnChanged,
                        sendOnPressed: _sendOnPressed,
                        actionHeight: actionHeight,
                        symbolCount: symbolCount,
                        replyToComment: selectedComment,
                        onTapToUnselect: _onTapToSelect,
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

  void _onTapToSelect(UserPostCommentEntity? selected) {
    setState(() {
      selectedComment = selected;
    });
  }

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
    final value = _newCommentController.text.trim();
    if (value.isNotEmpty) {
      context
          .read<UserCommentActionCubit>()
          .createComment(
            postId: postEntity.id,
            text: _newCommentController.text.trim(),
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
                  _newCommentController.clear();
                  _fieldOnChanged(_newCommentController.text);
                  Helpers.unfocused();
                  context.read<UserPostCommentCubit>().commentAdded(newComment);
                  context.read<UserPostCubit>().updateComments(ActionType.add);
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
    } else {
      CustomDialog.showMessageDialog(
        context,
        dictionary.commentCannotBeEmpty,
      ).whenComplete(() => _newCommentController.clear());
    }
  }
}
