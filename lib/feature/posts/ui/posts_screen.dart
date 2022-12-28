import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/app/ui/config/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../app/data/setting_provider/theme_provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Provider.of<ThemeProvider>(context).themeData;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: List.generate(
        10,
        (index) => Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: index % 2 == 0 ? AppColors.red : AppColors.purple,
        ),
      ),
    );
  }
}
