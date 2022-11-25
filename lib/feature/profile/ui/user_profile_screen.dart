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
import '../domain/state/user_profile_cubit.dart';
import '../domain/state/user_profile_follower/my_followers_cubit.dart';
import '../domain/state/user_profile_follower/user_profile_follower_cubit.dart';
import '../domain/state/user_profile_statistic/user_profile_statistic_cubit.dart';
import 'components/head_sliver_delegate.dart';
import 'components/item_divider.dart';
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
  }) : super(key: key);
  final String userId;
  final String firsName;
  final String lastName;
  final String image;

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
      ],
      child: _UserProfileScreen(
        userId: userId,
        firsName: firsName,
        lastName: lastName,
        image: image,
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
  }) : super(key: key);
  final String userId;
  final String firsName;
  final String lastName;
  final String image;

  @override
  State<_UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_UserProfileScreen> {
  late ThemeData theme;
  late AppLocalizations dictionary;
  late String imageUrl;

  late double expandedHeight;

  late UserProfileEntity userEntity;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.image;
    userEntity = UserProfileEntity(
      id: int.parse(widget.userId),
      firstName: widget.firsName,
      lastName: widget.lastName,
      image: widget.image,
      username: '',
      email: '',
      phoneNumber: '',
      dateOfBirth: DateTime.now(),
      country: '',
      area: '',
      city: '',
      isMale: true,
      blockedUsersId: <int>[],
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

    context.read<UserProfileCubit>().getUserProfile(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
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
                  imageUrl,
                  userEntity,
                ),
              ),
              SliverToBoxAdapter(
                child: state.maybeWhen(
                  received: (receivedUserEntity) {
                    context
                        .read<UserProfileStatisticCubit>()
                        .getUserProfileStatistic(widget.userId);

                    return Column(
                      children: [
                        const ProfileStatistic(),
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
                          posts: [
                            PostEntity(
                              id: 'id',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                              text: _longText,
                              image: 'http://zornet.ru/_fr/82/1132404.jpg',
                            ),
                            PostEntity(
                              id: 'id2',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                              text: _longText,
                            ),
                            PostEntity(
                                id: 'id3',
                                author:
                                    '${userEntity.firstName} ${userEntity.lastName}',
                                time: 'time',
                                image: 'http://zornet.ru/_fr/82/8567927.jpg'),
                            PostEntity(
                              id: 'id4',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                            PostEntity(
                              id: 'id5',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                            PostEntity(
                              id: 'id6',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                            PostEntity(
                              id: 'id7',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                            PostEntity(
                              id: 'id8',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                            PostEntity(
                              id: 'id9',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                            PostEntity(
                              id: 'id10',
                              author:
                                  '${userEntity.firstName} ${userEntity.lastName}',
                              time: 'time',
                            ),
                          ],
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
                      )
                    ],
                  ),
                  error: (error) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ItemDivider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 48.0,
                          horizontal: mainPadding,
                        ),
                        child: Text(
                          error.message,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline6?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: theme.textTheme.headline6?.color
                                ?.withOpacity(.5),
                          ),
                        ),
                      )
                    ],
                  ),
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
      ),
    );
  }
}

const String _longText = 'Some very long text. It\'s really very long text, '
    'but I don\'t speak english.\n\nI share your point of view'
    'A friend in need is a friend indeed.\n'
    'Easy come, easy go. Time is money. Better late than never.'
    '\n\nHave a good day';
