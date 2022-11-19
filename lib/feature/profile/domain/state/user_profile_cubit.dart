import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/domain/entities/error_entity/error_entity.dart';
import '../entities/user_profile/user_profile_entity.dart';
import '../profile_repository.dart';

part 'user_profile_state.dart';

part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(UserProfileState.init());

  final ProfileRepository _profileRepository;

  Future<void> getUserProfile(String userId) async {
    emit(UserProfileState.waiting());
    try {
      final result = await _profileRepository.getUserProfile(userId);
      emit(UserProfileState.received(result));
    } catch (error, stackTrace) {
      if (error is DioError && error.response?.statusCode == 403) {
        emit(UserProfileState.forbidden());
        return;
      }
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserProfileState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
