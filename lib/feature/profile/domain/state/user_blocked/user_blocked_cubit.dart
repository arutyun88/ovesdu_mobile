import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_blocked_state.dart';

part 'user_blocked_cubit.freezed.dart';

class UserBlockedCubit extends Cubit<UserBlockedState> {
  UserBlockedCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(UserBlockedState.init());

  final ProfileRepository _profileRepository;

  Future<void> getBlockedIds() async {
    emit(UserBlockedState.waiting());
    try {
      final result = await _profileRepository.getBlockedIds();
      emit(UserBlockedState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> addBlocked(String id) async {
    try {
      final result = await _profileRepository.addBlocked(id);
      emit(UserBlockedState.added(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> removeBlocked(String id) async {
    try {
      final result = await _profileRepository.removeBlocked(id);
      emit(UserBlockedState.removed(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserBlockedState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
