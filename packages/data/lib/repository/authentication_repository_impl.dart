import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

import '../core/network/network_info.dart';
import '../datasources/authentication_remote_datasource.dart';
import '../exceptions/exceptions.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource _authenticationRemoteDatasource;
  final NetworkInfo _networkInfo;

  const AuthenticationRepositoryImpl({
    required AuthenticationRemoteDatasource authenticationRemoteDatasource,
    required NetworkInfo networkInfo,
  })  : _authenticationRemoteDatasource = authenticationRemoteDatasource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, NameEntity>> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  ) async {
    try {
      if (await _networkInfo.isConnected) {
        final nameEntity = await _authenticationRemoteDatasource
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
