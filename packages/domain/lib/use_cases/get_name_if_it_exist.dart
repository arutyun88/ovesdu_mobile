import 'package:dartz/dartz.dart';
import 'package:domain/error/failures.dart';
import 'package:domain/repository/authentication_repository.dart';

import '../entity/name_entity.dart';

class GetNameIfItExist {
  final AuthenticationRepository authenticationRepository;

  const GetNameIfItExist(this.authenticationRepository);

  Future<Either<Failure, NameEntity>> execute(
    String usernameOrEmailOrPhoneNumber,
  ) async =>
      await authenticationRepository
          .getNameIfItExist(usernameOrEmailOrPhoneNumber);
}
