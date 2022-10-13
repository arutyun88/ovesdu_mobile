import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ovesdu_mobile/feature/auth/domain/state/auth_cubit.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({
    Key? key,
    required this.isNotAuthorized,
    required this.isAuthorized,
    required this.isWaiting,
  }) : super(key: key);

  final WidgetBuilder isNotAuthorized;
  final WidgetBuilder isAuthorized;
  final WidgetBuilder isWaiting;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.when(
          notAuthorized: () => isNotAuthorized(context),
          authorized: () => isAuthorized(context),
          waiting: () => isWaiting(context),
          error: (error) => isNotAuthorized(context),
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          error: (error) => _showSnackBar(context, error),
        );
      },
      listenWhen: (previous, current) =>
          previous.mapOrNull(error: (value) => value) !=
          current.mapOrNull(error: (value) => value),
    );
  }

  void _showSnackBar(BuildContext context, dynamic error) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: SingleChildScrollView(
            child: Text(
              error.toString(),
              maxLines: 5,
            ),
          ),
        ),
      );
}
