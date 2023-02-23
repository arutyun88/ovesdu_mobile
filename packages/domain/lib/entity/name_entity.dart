import 'package:equatable/equatable.dart';

class NameEntity extends Equatable {
  final String name;

  NameEntity(this.name);

  @override
  List<Object?> get props => [name];
}
