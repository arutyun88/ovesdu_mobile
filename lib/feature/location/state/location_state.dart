part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  factory LocationState.init() = _LocationStateInit;

  factory LocationState.requested() = _LocationStateRequested;

  factory LocationState.received(List<LocationEntity> locations) =
      _LocationStateReceived;

  factory LocationState.saved(LocationEntity location) = _LocationStateSaved;

  factory LocationState.error(ErrorEntity error) = _LocationStateError;
}
