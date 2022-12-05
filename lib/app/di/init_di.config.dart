// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/auth/data/network_auth_repository.dart' as _i10;
import '../../feature/auth/domain/auth_repository.dart' as _i9;
import '../../feature/auth/domain/state/auth_cubit.dart' as _i17;
import '../../feature/location/data/network_location_repository.dart' as _i12;
import '../../feature/location/domain/location_repository.dart' as _i11;
import '../../feature/profile/data/network_profile_repository.dart' as _i14;
import '../../feature/profile/domain/profile_repository.dart' as _i13;
import '../../feature/profile/domain/state/profile_cubit.dart' as _i18;
import '../../feature/user_post/data/user_posts_repository_impl.dart' as _i16;
import '../../feature/user_post/domain/state/user_post_comment/reaction/user_comment_reaction_cubit.dart'
    as _i19;
import '../../feature/user_post/domain/state/user_post_comment/user_post_comment_cubit.dart'
    as _i20;
import '../../feature/user_post/domain/state/user_post_cubit.dart' as _i21;
import '../../feature/user_post/domain/state/user_post_reaction/user_post_reaction_cubit.dart'
    as _i22;
import '../../feature/user_post/domain/user_post_repository.dart' as _i15;
import '../data/config/dev_app_config.dart' as _i4;
import '../data/config/prod_app_config.dart' as _i5;
import '../data/config/test_app_config.dart' as _i6;
import '../data/dio_app_api.dart' as _i8;
import '../domain/app_api.dart' as _i7;
import '../domain/app_config.dart' as _i3;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppConfig>(
    _i4.DevAppConfig(),
    registerFor: {_dev},
  );
  gh.singleton<_i3.AppConfig>(
    _i5.ProdAppConfig(),
    registerFor: {_prod},
  );
  gh.singleton<_i3.AppConfig>(
    _i6.TestAppConfig(),
    registerFor: {_test},
  );
  gh.singleton<_i7.AppApi>(_i8.DioAppApi(get<_i3.AppConfig>()));
  gh.factory<_i9.AuthRepository>(
      () => _i10.NetworkAuthRepository(get<_i7.AppApi>()));
  gh.factory<_i11.LocationRepository>(
      () => _i12.NetworkLocationRepository(get<_i7.AppApi>()));
  gh.factory<_i13.ProfileRepository>(
      () => _i14.NetworkProfileRepository(get<_i7.AppApi>()));
  gh.factory<_i15.UserPostRepository>(
      () => _i16.UserPostRepositoryImpl(get<_i7.AppApi>()));
  gh.singleton<_i17.AuthCubit>(_i17.AuthCubit(get<_i9.AuthRepository>()));
  gh.singleton<_i18.ProfileCubit>(
      _i18.ProfileCubit(get<_i13.ProfileRepository>()));
  gh.singleton<_i19.UserCommentReactionCubit>(
      _i19.UserCommentReactionCubit(get<_i15.UserPostRepository>()));
  gh.singleton<_i20.UserPostCommentCubit>(
      _i20.UserPostCommentCubit(get<_i15.UserPostRepository>()));
  gh.singleton<_i21.UserPostCubit>(
      _i21.UserPostCubit(get<_i15.UserPostRepository>()));
  gh.singleton<_i22.UserPostReactionCubit>(
      _i22.UserPostReactionCubit(get<_i15.UserPostRepository>()));
  return get;
}
