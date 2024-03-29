import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:domain/entity/location_entity/location_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

part 'location_event.dart';

part 'location_cubit.freezed.dart';

@Singleton()
class LocationCubit extends Bloc<LocationEvent, LocationState> {
  LocationCubit(this.locationRepository) : super(LocationState.init()) {
    on<LocationEventGet>(
      (event, emit) => getLocation(event.query, event.remote, emit),
      transformer: restartable(),
    );
    on<LocationEventSave>(
      (event, emit) => saveLocation(event.lat, event.lon, emit),
      transformer: restartable(),
    );
  }

  final LocationRepository locationRepository;

  Future<void> getLocation(String query, bool remote, Emitter emit) async {
    emit(LocationState.requested());
    try {
      final result = remote
          ? await locationRepository.searchLocations(query)
          : await locationRepository.getLocations(query);
      emit(LocationState.received(result));
    } catch (error, stackTrace) {
      emit(LocationState.error(ErrorEntity.fromException(error)));
      addError(error, stackTrace);
    }
  }

  Future<void> saveLocation(String lat, String lon, Emitter emit) async {
    emit(LocationState.requested());
    try {
      final result = await locationRepository.saveLocation(lat, lon);
      emit(LocationState.saved(result));
    } catch (error, stackTrace) {
      emit(LocationState.error(ErrorEntity.fromException(error)));
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    super.addError(error, stackTrace);
  }
}
