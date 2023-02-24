import 'dart:convert';

import 'package:data/models/json_keys.dart';
import 'package:data/models/name_model.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

import '../resources/resources_reader.dart';

void main() {
  final dataFileSuccess = 'name_data_success';
  final dataFileError = 'name_data_error';
  final nameModel = NameModel('Some');
  final expectedMap = {nameKey: 'Some'};

  test(
    'should be a subclass of Name entity',
    () async {
      expect(nameModel, isA<NameEntity>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model by json',
      () async {
        final Map<String, dynamic> json = jsonDecode(reader(dataFileSuccess));
        final resultData = NameModel.fromJson(json[dataKey]);
        final resultMessage = json[messageKey] as String;
        final resultError = json[errorKey] as String;
        expect(resultMessage, isEmpty);
        expect(resultError, isEmpty);
        expect(resultData, nameModel);
      },
    );

    test(
      'should return error model by json',
      () async {
        final Map<String, dynamic> json = jsonDecode(reader(dataFileError));
        final resultData = json[dataKey] as String;
        final resultMessage = json[messageKey] as String;
        final resultError = json[errorKey] as String;
        expect(resultData, isEmpty);
        expect(resultError, isEmpty);
        expect(resultMessage, isNotEmpty);
        expect(resultMessage, isA<String>());
      },
    );
  });

  group('toJson', () {
    test(
      'should return a json by model',
      () async {
        final result = nameModel.toJson();
        expect(result, expectedMap);
      },
    );
  });
}
