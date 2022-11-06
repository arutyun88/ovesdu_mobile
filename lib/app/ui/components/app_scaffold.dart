import 'package:flutter/material.dart';

import 'notification_bar/notification_top_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required Widget body,
    PreferredSizeWidget? appBar,
    required ValueNotifier<List<String>> notifications,
  })  : _body = body,
        _appBar = appBar,
        _notifications = notifications,
        super(key: key);

  final Widget _body;
  final PreferredSizeWidget? _appBar;
  final ValueNotifier<List<String>> _notifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          _body,
          NotificationTopBar(notifications: _notifications),
        ],
      ),
    );
  }
}
