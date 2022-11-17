import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';

import '../../../app/di/init_di.dart';
import '../../../app/ui/app_loader.dart';
import '../domain/profile_repository.dart';
import '../domain/state/user_profile_cubit.dart';
import 'components/head_sliver_delegate.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(locator.get<ProfileRepository>()),
      child: _UserProfileScreen(username: username),
    );
  }
}

class _UserProfileScreen extends StatefulWidget {
  const _UserProfileScreen({
    Key? key,
    required this.username,
  }) : super(key: key);
  final String username;

  @override
  State<_UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_UserProfileScreen> {
  late ThemeData theme;
  final imageUrl = 'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-'
      'Norris-Net-Worth-100-million.jpg';

  late double expandedHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
    expandedHeight = MediaQuery.of(context).size.height > 700
        ? 420
        : MediaQuery.of(context).size.height * .6;

    context.read<UserProfileCubit>().getUserProfile(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            received: (userEntity) => CustomScrollView(
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
                ...List.generate(
                  3,
                  (index) => const SliverToBoxAdapter(child: Placeholder()),
                ),
              ],
            ),
            orElse: () => const AppLoader(),
          );
        },
      ),
    );
  }
}
