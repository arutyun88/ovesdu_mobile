part of 'location_cubit.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.get(String query, bool remote) = LocationEventGet;

  const factory LocationEvent.save(String lat, String lon) = LocationEventSave;
}
