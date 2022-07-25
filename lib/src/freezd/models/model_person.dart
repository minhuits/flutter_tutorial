import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_person.freezed.dart';
part 'model_person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required int id,
    String? firstName,
    String? lastName,
    int? age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
