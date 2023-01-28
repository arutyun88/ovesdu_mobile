import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

void configureDependencies(GetIt instance) {
  /// CONFIGURATIONS
  instance.registerSingleton<AppConfig>(DevAppConfig());
  instance.registerSingleton<ApiDio>(ApiDioImpl(instance()));
  instance.registerSingleton<AppApi>(DioAppApi(instance()));
  instance.registerSingleton<AuthApi>(DioAuthApi(instance()));

  /// REPOSITORIES
  instance.registerSingleton<AuthRepository>(
    NetworkAuthRepository(instance()),
  );
  instance.registerSingleton<LocationRepository>(
    NetworkLocationRepository(instance()),
  );
  instance.registerSingleton<PostRepository>(
    PostRepositoryImpl(instance()),
  );
  instance.registerSingleton<ProfileRepository>(
    NetworkProfileRepository(instance()),
  );
  instance.registerSingleton<UserPostRepository>(
    UserPostRepositoryImpl(instance()),
  );

  /// GLOBAL STATE MANAGERS
  instance.registerSingleton<AuthCubit>(AuthCubit(instance()));
}
