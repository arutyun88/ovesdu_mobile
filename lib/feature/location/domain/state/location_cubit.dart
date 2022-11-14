import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/domain/entities/error_entity/error_entity.dart';
import '../entities/location_entity/location_entity.dart';
import '../location_repository.dart';

part 'location_state.dart';

part 'location_event.dart';

part 'location_cubit.freezed.dart';

class LocationCubit extends Bloc<LocationEvent, LocationState> {
  LocationCubit(this.locationRepository) : super(LocationState.init()) {
    on<LocationEventGet>(
      (event, emit) => getLocation(event.query, event.remote, emit),
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

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    super.addError(error, stackTrace);
  }
}
