import 'dart:convert';

import 'package:data/datasources/authentication_remote_datasource.dart';
import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import '../resources/resources_reader.dart';
import 'authentication_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late AuthenticationRemoteDatasource datasource;
  late Dio client;

  setUp(() {
    client = MockDio();
    datasource = AuthenticationRemoteDatasourceImpl(client: client);
  });

  final tNameModel =
      NameModel.fromJson(jsonDecode(reader('name_data_success'))['data']);
  final qName = tNameModel.name;
  final path = '/auth/info/$qName';

  Response response(String value, int code) => Response(
        requestOptions: RequestOptions(path: path),
        statusCode: code,
        data: value,
      );

  void setUpMockClientSuccess200() => when(client.get(path)).thenAnswer(
      (_) async => Future.value(response(reader('name_data_success'), 200)));

  group('getNameIfItExist', () {
    test(
      '''should perform GET request on a URL with username or email 
      or phone number being the endpoint, once''',
      () async {
        setUpMockClientSuccess200();

        datasource.getNameIfItExist(qName);

        verify(client.get(path)).called(1);
      },
    );

    test(
      'should return NameModel when the response code is 200',
      () async {
        setUpMockClientSuccess200();

        final result = await datasource.getNameIfItExist(qName);

        expect(result, tNameModel);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(client.get(path)).thenAnswer((_) async =>
            Future.value(response(reader('name_data_error'), 404)));

        final call = datasource.getNameIfItExist;

        expect(() => call(qName), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
