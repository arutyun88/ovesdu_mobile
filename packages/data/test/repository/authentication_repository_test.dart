import 'package:dartz/dartz.dart';
import 'package:data/core/network/network_info.dart';
import 'package:data/datasources/authentication_remote_datasource.dart';
import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';
import 'package:data/repository/authentication_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateMocks([AuthenticationRemoteDatasource])
@GenerateMocks([NetworkInfo])
void main() {
  late AuthenticationRepositoryImpl authenticationRepository;
  late AuthenticationRemoteDatasource authenticationRemoteDatasource;
  late NetworkInfo networkInfo;

  final qName = 'some';
  final tNameModel = NameModel('Some');
  final NameEntity tNameEntity = tNameModel;

  setUp(() {
    authenticationRemoteDatasource = MockAuthenticationRemoteDatasource();
    networkInfo = MockNetworkInfo();
    authenticationRepository = AuthenticationRepositoryImpl(
      authenticationRemoteDatasource: authenticationRemoteDatasource,
      networkInfo: networkInfo,
    );
  });

  group('getNameIfItExist', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(authenticationRemoteDatasource.getNameIfItExist(qName))
            .thenAnswer((_) async => tNameModel);
        // act
        authenticationRepository.getNameIfItExist(qName);
        // assert
        verify(networkInfo.isConnected);
      },
    );

    group('when device is online', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote datasource is successful',
        () async {
          // arrange
          when(authenticationRemoteDatasource.getNameIfItExist(qName))
              .thenAnswer((_) async => tNameModel);
          // act
          final result = await authenticationRepository.getNameIfItExist(qName);
          // assert
          verify(authenticationRemoteDatasource.getNameIfItExist(qName));
          expect(result, Right(tNameEntity));
        },
      );

      test(
        'should return ServerFailure when the call to remote datasource is unsuccessful',
        () async {
          // arrange
          when(authenticationRemoteDatasource.getNameIfItExist(qName))
              .thenThrow(ServerException());
          // act
          final result = await authenticationRepository.getNameIfItExist(qName);
          // assert
          verify(authenticationRemoteDatasource.getNameIfItExist(qName));
          expect(result, Left(ServerFailure()));
        },
      );
    });

    group('when device is offline', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should return NetworkFailure when device is offline',
        () async {
          // arrange
          when(authenticationRemoteDatasource.getNameIfItExist(qName))
              .thenThrow(NetworkException());
          // act
          final result = await authenticationRepository.getNameIfItExist(qName);
          // assert
          verifyZeroInteractions(authenticationRemoteDatasource);
          expect(result, Left(NetworkFailure()));
        },
      );
    });
  });
}
