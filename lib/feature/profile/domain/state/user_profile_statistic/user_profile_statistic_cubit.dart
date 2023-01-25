import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_statistic_state.dart';

part 'user_profile_statistic_cubit.freezed.dart';

class UserProfileStatisticCubit extends Cubit<UserProfileStatisticState> {
  UserProfileStatisticCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(UserProfileStatisticState.init());

  final ProfileRepository _profileRepository;

  Future<void> getUserProfileStatistic(String userId) async {
    emit(UserProfileStatisticState.waiting());
    try {
      final result = await _profileRepository.getUserProfileStatistic(userId);
      emit(UserProfileStatisticState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserProfileStatisticState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
