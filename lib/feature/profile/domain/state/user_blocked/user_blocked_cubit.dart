import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../profile_repository.dart';

part 'user_blocked_state.dart';

part 'user_blocked_cubit.freezed.dart';

class UserBlockedCubit extends Cubit<UserBlockedState> {
  UserBlockedCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(UserBlockedState.init());

  final ProfileRepository _profileRepository;

  Future<void> getMyFollowersIds() async {
    emit(UserBlockedState.waiting());
    try {
      final result = await _profileRepository.getBlockedIds();
      emit(UserBlockedState.received(result));
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
