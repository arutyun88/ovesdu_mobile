import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({
    Key? key,
    required this.isNotAuthorized,
    required this.isAuthorized,
  }) : super(key: key);

  final WidgetBuilder isNotAuthorized;
  final ValueWidgetBuilder isAuthorized;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.when(
          notAuthorized: () => isNotAuthorized(context),
          authorized: (tokenEntity) => isAuthorized(context, tokenEntity, this),
          waiting: () => isNotAuthorized(context),
          checked: (value) => isNotAuthorized(context),
          usernameChecked: () => isNotAuthorized(context),
          contactChecked: () => isNotAuthorized(context),
          error: (error) => isNotAuthorized(context),
        );
      },
    );
  }
}
