import 'dart:convert';

import 'package:data/datasources/authentication_remote_datasource.dart';
import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../resources/resources_reader.dart';
import 'authentication_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late AuthenticationRemoteDatasource datasource;
  late MockClient client;

  setUp(() {
    client = MockClient();
    datasource = AuthenticationRemoteDatasourceImpl(client: client);
  });

  void setUpMockClientSuccess200() =>
      when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(reader('name_data_success'), 200));

  group('getNameIfItExist', () {
    final qName = 'some';
    final tNameModel = NameModel.fromJson(
      jsonDecode(reader('name_data_success'))['data'],
    );

    test(
      '''should perform GET request on a URL with username or email 
      or phone number being the endpoint and with application/json header''',
      () {
        setUpMockClientSuccess200();

        datasource.getNameIfItExist(qName);

        verify(client.get(
          Uri(path: '/auth/info/$qName'),
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return NameEntity when the response code is 200',
      () async {
        setUpMockClientSuccess200();

        final result = await datasource.getNameIfItExist(qName);

        expect(result, tNameModel);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(client.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response(reader('name_data_error'), 404));

        final call = datasource.getNameIfItExist;

        expect(() => call(qName), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
