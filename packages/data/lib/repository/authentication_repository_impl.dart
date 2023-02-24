import 'package:dartz/dartz.dart';
import 'package:data/exceptions/exceptions.dart';
import 'package:domain/domain.dart';

import '../core/platform/network_info.dart';
import '../datasources/authentication_remote_datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;
  final NetworkInfo networkInfo;

  const AuthenticationRepositoryImpl({
    required this.authenticationRemoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NameEntity>> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final nameEntity = await authenticationRemoteDatasource
            .getNameIfItExist(usernameOrEmailOrPhoneNumber);
        return Right(nameEntity);
      } else {
        throw NetworkException();
      }
    } on ServerException {
      return Left(ServerFailure());
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
