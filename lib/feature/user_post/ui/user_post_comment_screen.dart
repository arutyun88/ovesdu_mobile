import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/helpers/helpers.dart';
import '../../../app/ui/components/custom_dialog/custom_dialog.dart';
import '../domain/entity/user_post/user_post_entity.dart';
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
    return Scaffold(
      body: GestureDetector(
        onTap: Helpers.unfocused,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  UserCommentPostHeader(
                    postEntity: postEntity,
                    avatar: widget.avatar,
                    lastVisit: widget.lastVisit,
                    post: widget.post,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          UserCommentPost(
                            avatar: widget.avatar,
                            lastVisit: widget.lastVisit,
                            post: widget.post,
                          ),
                          const UserCommentList(),
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
                  child: UserCommentField(
                    controller: _newCommentController,
                    onChanged: _fieldOnChanged,
                    sendOnPressed: _sendOnPressed,
                    actionHeight: actionHeight,
                    symbolCount: symbolCount,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
