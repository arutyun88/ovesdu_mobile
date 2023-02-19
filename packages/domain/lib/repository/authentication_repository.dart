import 'package:dartz/dartz.dart';
import 'package:domain/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  );
}
