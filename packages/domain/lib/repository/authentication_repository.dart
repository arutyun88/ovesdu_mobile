import 'package:dartz/dartz.dart';
import 'package:domain/error/failures.dart';

import '../entity/name_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, NameEntity>> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  );
}
