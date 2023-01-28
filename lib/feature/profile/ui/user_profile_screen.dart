import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../../../app/ui/config/app_colors.dart';
import '../../user_post/state/user_post_cubit.dart';
import '../state/profile_cubit.dart';
import '../state/user_blocked/user_blocked_cubit.dart';
import '../state/user_profile_cubit.dart';
import '../state/user_profile_follower/my_followers_cubit.dart';
import '../state/user_profile_follower/user_profile_follower_cubit.dart';
import '../state/user_profile_statistic/user_profile_statistic_cubit.dart';
import 'components/head_sliver_delegate/head_sliver_delegate.dart';
import '../../../app/ui/components/item_divider.dart';
import 'components/profile_gifts.dart';
import 'components/profile_photos.dart';
import 'components/profile_posts.dart';
import 'components/profile_programs.dart';
import 'components/profile_statistic.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    Key? key,
    required this.userId,
    required this.firsName,
    required this.lastName,
    required this.image,
    this.onTapToBack,
  }) : super(key: key);
  final String userId;
  final String firsName;
  final String lastName;
  final String? image;
  final VoidCallback? onTapToBack;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserProfileStatisticCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserProfileFollowersCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => MyFollowersCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserBlockedCubit(
            locator.get<ProfileRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserPostCubit(
            locator.get<UserPostRepository>(),
          ),
        ),
      ],
      child: _UserProfileScreen(
        userId: userId,
        firsName: firsName,
        lastName: lastName,
        image: image,
        onTapToBack: onTapToBack,
      ),
    );
  }
}

class _UserProfileScreen extends StatefulWidget {
  const _UserProfileScreen({
    Key? key,
    required this.userId,
    required this.firsName,
    required this.lastName,
    required this.image,
    this.onTapToBack,
  }) : super(key: key);

  final String userId;
  final String firsName;
  final String lastName;
  final String? image;
  final VoidCallback? onTapToBack;

  @override
  State<_UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_UserProfileScreen> {
  late ThemeData theme;
  late AppLocalizations dictionary;

  late double expandedHeight;

  late UserProfileEntity userEntity;

  late bool blocked;

  @override
  void initState() {
    super.initState();
    userEntity = UserProfileEntity(
      id: int.parse(widget.userId),
      firstName: widget.firsName,
      lastName: widget.lastName,
      image: widget.image,
      username: '',
      email: '',
      phoneNumber: '',
      dateOfBirth: DateTime.now(),
      lastVisit: DateTime.now(),
      country: '',
      area: '',
      city: '',
      isMale: true,
      blockedUsersId: <int>[],
    );

    context.read<UserProfileCubit>().getUserProfile(widget.userId).whenComplete(
      () {
        context.read<UserProfileStatisticCubit>().getUserProfileStatistic(
              widget.userId,
            );

        context.read<UserPostCubit>().getUserPosts(
              id: int.parse(widget.userId),
              limit: 10,
              last: 0,
            );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    theme = Provider.of<ThemeProvider>(context).themeData;
    dictionary = AppLocalizations.of(context)!;

    expandedHeight = MediaQuery.of(context).size.height > 700
        ? 420
        : MediaQuery.of(context).size.height * .6;

    blocked = locator.get<ProfileCubit>().state.whenOrNull(
            received: (entity) =>
                entity.blockedUsersId.contains(userEntity.id)) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: BlocConsumer<UserBlockedCubit, UserBlockedState>(
        listener: (context, blockedState) {
          blockedState.whenOrNull(
            added: (id) => blocked = true,
            removed: (id) => blocked = false,
          );
        },
        builder: (context, blockedState) {
          return BlocBuilder<UserProfileCubit, UserProfileState>(
            builder: (context, state) {
              state.whenOrNull(
                received: (receivedUser) {
                  userEntity = receivedUser;
                },
              );
              return CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: HeadSliverDelegate(
                      expandedHeight,
                      userEntity,
                      onTapToBack: widget.onTapToBack,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: state.maybeWhen(
                      received: (receivedUserEntity) {
                        return blocked
                            ? _ErrorWidget(message: dictionary.blockedUser)
                            : Column(
                                children: [
                                  ProfileStatistic(
                                    receivedUser: receivedUserEntity,
                                  ),
                                  const ProfilePrograms(),
                                  ProfileGifts(
                                    gifts: [
                                      GiftEntity(Gift.a1, true, 'sender'),
                                      GiftEntity(Gift.a2, false, null),
                                      GiftEntity(Gift.b1, true, null),
                                      GiftEntity(Gift.a5, true, 'sender'),
                                    ],
                                  ),
                                  const ProfilePhotos(
                                    images: [
                                      'http://zornet.ru/_fr/82/5237306.jpg',
                                      'http://zornet.ru/_fr/82/1132404.jpg',
                                      'http://zornet.ru/_fr/82/4773685.jpg',
                                      'http://zornet.ru/_fr/82/8472417.jpg',
                                      'http://zornet.ru/_fr/82/8567927.jpg',
                                    ],
                                  ),
                                  ProfilePosts(
                                    avatar: receivedUserEntity.image,
                                    lastVisit: receivedUserEntity.lastVisit,
                                  ),
                                ],
                              );
                      },
                      forbidden: () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ItemDivider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 48.0,
                              horizontal: mainPadding,
                            ),
                            child: Text(
                              dictionary.forbidden(userEntity.firstName),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headline6?.copyWith(
                                fontStyle: FontStyle.italic,
                                color: theme.textTheme.headline6?.color
                                    ?.withOpacity(.5),
                              ),
                            ),
                          ),
                          BlocConsumer<UserBlockedCubit, UserBlockedState>(
                            listener: (context, state) {
                              blocked =
                                  state.whenOrNull(added: (received) => true) ??
                                      false;
                            },
                            builder: (context, state) {
                              return blocked
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: mainPadding,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          dictionary.deadlock,
                                          textAlign: TextAlign.right,
                                          style: theme.textTheme.headline6
                                              ?.copyWith(
                                            fontStyle: FontStyle.italic,
                                            color: theme
                                                .textTheme.headline6?.color
                                                ?.withOpacity(.5),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                      error: (error) => _ErrorWidget(message: error.message),
                      orElse: () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          ItemDivider(),
                          Padding(
                            padding: EdgeInsets.only(top: 36.0),
                            child: CircularProgressIndicator(
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ItemDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48.0,
            horizontal: mainPadding,
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline6?.copyWith(
              fontStyle: FontStyle.italic,
              color: theme.textTheme.headline6?.color?.withOpacity(.5),
            ),
          ),
        )
      ],
    );
  }
}
