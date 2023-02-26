import 'dart:convert';

import 'package:data/core/wrappers/request_wrapper.dart';
import 'package:data/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../datasources/authentication_remote_datasource_test.mocks.dart';
import '../../resources/resources_reader.dart';

@GenerateMocks([Dio])
void main() {
  final successData = jsonDecode(reader('common_response_body_success'));
  final successResponse = Future.value(Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
      data: successData));

  final errorData = jsonDecode(reader('common_response_body_error'));
  final errorResponse = Future.value(Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 404,
      data: errorData));

  final Dio client = MockDio();
  final RequestWrapper wrapper = RequestWrapper.testInstance(client);

  group('RequestWrapper', () {
    test(
      'should be called the client\'s GET method',
      () async {
        when(client.get('')).thenAnswer((_) async => successResponse);

        wrapper.get('');

        verify(client.get('')).called(1);
      },
    );

    test(
      'should return JSON data when the response code is 200',
      () async {
        when(client.get('')).thenAnswer((_) async => successResponse);

        final result = await wrapper.get('');

        expect(result, successData);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(client.get('')).thenAnswer((_) async => errorResponse);

        final call = wrapper.get;

        expect(() => call(''), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
