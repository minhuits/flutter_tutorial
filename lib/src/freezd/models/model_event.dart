import 'package:freezed_annotation/freezed_annotation.dart';

import 'model_person.dart';

part 'model_event.freezed.dart';

@freezed
class PersonEvent with _$PersonEvent {
  const factory PersonEvent({
    required Person person,
    @Default(200) int statusCode,
  }) = _PersonEvent;

  factory PersonEvent.loading({int? statusCode}) = _Loading;
  factory PersonEvent.error({
    String? massage,
    @Default(404) int statusCode,
  }) = _Error;
}
