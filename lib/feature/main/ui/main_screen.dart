import 'package:flutter/material.dart';
import 'package:ovesdu_mobile/feature/auth/domain/state/auth_cubit.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainScreen'),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthCubit>().logOut(),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
