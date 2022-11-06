part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  factory LocationState.init() = _LocationStateInit;

  factory LocationState.requested() = _LocationStateRequested;

  factory LocationState.received(String location) = _LocationStateReceived;

  factory LocationState.error(ErrorEntity error) = _LocationStateError;
}
