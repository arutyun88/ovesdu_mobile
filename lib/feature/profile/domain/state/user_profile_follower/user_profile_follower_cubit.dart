import 'package:domain/domain.dart';
import 'package:domain/entity/error_entity/error_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_follower_state.dart';

part 'user_profile_follower_cubit.freezed.dart';

class UserProfileFollowersCubit extends Cubit<UserProfileFollowersState> {
  UserProfileFollowersCubit(ProfileRepository profileRepository)
      : _profileRepository = profileRepository,
        super(UserProfileFollowersState.init());

  final ProfileRepository _profileRepository;

  Future<void> getUserProfileFollowers(
    List<int> followers,
    List<int> following,
  ) async {
    emit(UserProfileFollowersState.waiting());
    try {
      final result = await _profileRepository.getUserProfileFollowers(
        followers,
        following,
      );
      emit(UserProfileFollowersState.received(result));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(UserProfileFollowersState.error(ErrorEntity.fromException(error)));
    super.addError(error, stackTrace);
  }
}
