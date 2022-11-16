import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/di/init_di.dart';
import '../domain/entities/user_profile/user_profile_entity.dart';
import '../domain/state/profile_cubit.dart';
import 'components/head_sliver_delegate.dart';
import 'components/item_divider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
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
      body: Hero(
        tag: 'some',
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate:
                  HeadSliverDelegate(expandedHeight, imageUrl, userEntity),
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
      ),
    );
  }
}
