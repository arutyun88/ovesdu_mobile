import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/const/const.dart';
import '../../../app/data/setting_provider/theme_provider.dart';
import '../../../app/ui/config/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var top = 0.0;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).themeData;
    const imageUrl =
        'https://caknowledge.com/wp-content/uploads/2022/05/Chuck-Norris-Net-Worth-100-million.jpg';
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const ClampingScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                // leading: const Icon(Icons.arrow_back_ios),
                expandedHeight: MediaQuery.of(context).size.height * .35,
                backgroundColor: theme.backgroundColor,
                collapsedHeight: 75,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(
                        left: 24.0,
                        right: 24.0,
                        bottom: 12.0,
                      ),
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: top <= 130 ? 1.0 : 0.0,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: AppColors.orange,
                                      strokeAlign: StrokeAlign.outside)),
                              child: const Image(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: mainPadding / 2,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Chuck',
                                      style: theme.textTheme.headline6,
                                    ),
                                    Text(
                                      'Norris',
                                      style: theme.textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.more_horiz,
                              size: mainPadding,
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),
                      background: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.edit),
                      title: Text('title $index'),
                      subtitle: Text('subtitle $index'),
                      trailing: const Icon(Icons.delete),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _header(context, MediaQuery.of(context).size.height * .35),
        ],
      ),
    );
  }

  Widget _header(BuildContext context, double defaultMargin) {
    const double initHeight = 100;
    final double margin = defaultMargin - initHeight / 2;

    double height = initHeight;
    double top = margin;

    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      if (offset >= 0 && offset < 200) {
        scale = (margin - offset) / margin;
        height = height - offset / 2;
        top -= offset / 2;
      } else {
        height = 0.0;
      }
    }

    return Positioned(
      top: top,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).themeData.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(mainPadding * scale),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: mainPadding * .75,
                vertical: mainPadding * .5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chuck',
                    style: Provider.of<ThemeProvider>(context)
                        .themeData
                        .textTheme
                        .headline5,
                  ),
                  Text(
                    'Norris',
                    style: Provider.of<ThemeProvider>(context)
                        .themeData
                        .textTheme
                        .headline6,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orange,
                  border: Border.all(
                    color: AppColors.hintTextColor.withOpacity(.5),
                    strokeAlign: StrokeAlign.inside,
                  ),
                ),
                child: const Icon(
                  Icons.message,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
