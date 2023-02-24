import 'package:domain/domain.dart';

import 'json_keys.dart';

class NameModel extends NameEntity {
  NameModel(String name) : super(name);

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      NameModel(json[nameKey]);

  Map<String, dynamic> toJson() => {nameKey: name};
}
