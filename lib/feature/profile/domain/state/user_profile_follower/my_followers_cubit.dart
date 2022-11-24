import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app/domain/entities/error_entity/error_entity.dart';
import '../../entities/user_profile_follower/user_simple_followers_entity.dart';
import '../../profile_repository.dart';

part 'my_followers_state.dart';

part 'my_followers_cubit.freezed.dart';

class MyFollowersCubit extends Cubit<MyFollowersState> {
  MyFollowersCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(MyFollowersState.init());

  final ProfileRepository _profileRepository;

  Future<void> getMyFollowersIds() async {
    emit(MyFollowersState.waiting());
    try {
      final result = await _profileRepository.getMyFollowersIds();
      emit(MyFollowersState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> createFollowing(String id) async {
    try {
      final result = await _profileRepository.createFollowing(id);
      emit(MyFollowersState.created(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> deleteFollowing(String id) async {
    try {
      final result = await _profileRepository.deleteFollowing(id);
      emit(MyFollowersState.deleted(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(MyFollowersState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
