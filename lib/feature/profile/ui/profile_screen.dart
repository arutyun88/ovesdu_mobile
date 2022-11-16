import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/state/profile_cubit.dart';
import 'components/item_divider.dart';
import 'components/user_profile_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late AppLocalizations dictionary;
  final imageUrl = 'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-'
      'Norris-Net-Worth-100-million.jpg';

  late double expandedHeight;
  late UserProfileEntity? userEntity;

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

    dictionary = AppLocalizations.of(context)!;
    expandedHeight = MediaQuery.of(context).size.height > 700
        ? 420
        : MediaQuery.of(context).size.height * .6;

    userEntity = locator.get<ProfileCubit>().state.whenOrNull(
          received: (userEntity) => userEntity,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 2.0,
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * .50,
            backgroundColor: theme.backgroundColor,
            collapsedHeight: 75,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return UserAppBar(
                  top: constraints.biggest.height,
                  userEntity: userEntity,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const ItemDivider(),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 25,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.edit),
                      title: Text('title $index'),
                      subtitle: Text('subtitle $index'),
                      trailing: const Icon(Icons.delete),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
