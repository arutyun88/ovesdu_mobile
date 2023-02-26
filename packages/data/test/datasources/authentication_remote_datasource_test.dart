import 'dart:convert';

import 'package:data/core/wrappers/request_wrapper.dart';
import 'package:data/datasources/authentication_remote_datasource.dart';
import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../resources/resources_reader.dart';
import 'authentication_remote_datasource_test.mocks.dart';

@GenerateMocks([RequestWrapper])
void main() {
  final successResponse = jsonDecode(reader('name_data_success'));

  late AuthenticationRemoteDatasource datasource;
  late RequestWrapper wrapper;

  setUp(() {
    wrapper = MockRequestWrapper();
    datasource = AuthenticationRemoteDatasourceImpl(wrapper: wrapper);
  });

  final tNameModel =
      NameModel.fromJson(jsonDecode(reader('name_data_success'))['data']);
  final qName = tNameModel.name;
  final path = '/auth/info/$qName';

  group('AuthenticationRemoteDatasource: getNameIfItExist', () {
    test(
      '''should call GET method on wrapper with username or email 
      or phone number being the endpoint, once''',
      () async {
        when(wrapper.get(path))
            .thenAnswer((_) async => Future.value(successResponse));

        datasource.getNameIfItExist(qName);

        verify(wrapper.get(path)).called(1);
      },
    );

    test(
      'should return NameModel when the request was successful',
      () async {
        when(wrapper.get(path))
            .thenAnswer((_) async => Future.value(successResponse));

        final result = await datasource.getNameIfItExist(qName);

        expect(result, tNameModel);
      },
    );

    test(
      'should throw a ServerException when the request failed',
      () async {
        when(wrapper.get(path)).thenThrow(ServerException());

        final call = datasource.getNameIfItExist;

        expect(() => call(qName), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
