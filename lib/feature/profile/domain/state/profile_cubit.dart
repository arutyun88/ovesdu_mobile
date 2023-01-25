import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

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

  Future<void> addedBlocked(int id) async {
    try {
      var receivedEntity = state.whenOrNull(
        received: (receivedEntity) => receivedEntity,
      );
      var newList = receivedEntity?.blockedUsersId.map((e) => e).toList() ?? [];
      if (!newList.contains(id)) {
        newList.add(id);
      }
      final newResult = receivedEntity?.copyWith(blockedUsersId: newList);
      emit(ProfileState.received(newResult!));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> removeBlocked(int id) async {
    try {
      var receivedEntity = state.whenOrNull(
        received: (receivedEntity) => receivedEntity,
      );
      var newList = receivedEntity?.blockedUsersId.map((e) => e).toList() ?? [];
      if (newList.contains(id)) {
        newList.remove(id);
      }
      final newResult = receivedEntity?.copyWith(blockedUsersId: newList);
      emit(ProfileState.received(newResult!));
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
