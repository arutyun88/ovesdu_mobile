import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/domain/entities/error_entity/error_entity.dart';
import '../entities/user_profile/user_profile_entity.dart';
import '../profile_repository.dart';

part 'profile_state.dart';

part 'profile_cubit.freezed.dart';

@Singleton()
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(ProfileState.init());

  final ProfileRepository _profileRepository;

  Future<void> getProfile() async {
    emit(ProfileState.waiting());
    try {
      final result = await _profileRepository.getProfile();
      emit(ProfileState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> getUserProfile(String username) async {
    emit(ProfileState.waiting());
    try {
      final result = await _profileRepository.getUserProfile(username);
      emit(ProfileState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(ProfileState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
