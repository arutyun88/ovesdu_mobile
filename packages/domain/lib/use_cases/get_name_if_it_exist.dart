import 'package:dartz/dartz.dart';

import '../entity/name_entity.dart';
import '../error/failures.dart';
import '../repository/authentication_repository.dart';

class GetNameIfItExist {
  final AuthenticationRepository _authenticationRepository;

  const GetNameIfItExist(AuthenticationRepository authenticationRepository)
      : _authenticationRepository = authenticationRepository;

  Future<Either<Failure, NameEntity>> execute(
    String usernameOrEmailOrPhoneNumber,
  ) async =>
      await _authenticationRepository
          .getNameIfItExist(usernameOrEmailOrPhoneNumber);
}
