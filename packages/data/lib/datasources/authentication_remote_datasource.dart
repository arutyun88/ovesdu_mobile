import 'package:data/exceptions/exceptions.dart';
import 'package:data/models/name_model.dart';

import '../core/helpers/app_header.dart';
import '../core/helpers/device_helper.dart';
import '../core/wrappers/request_wrapper.dart';
import '../dio/app_dio.dart';

abstract class AuthenticationRemoteDatasource {
  /// Calls the /auth/info/{[usernameOrEmailOrPhoneNumber]} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NameModel> getNameIfItExist(String usernameOrEmailOrPhoneNumber);
}

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  late final RequestWrapper _wrapper;

  AuthenticationRemoteDatasourceImpl({
    RequestWrapper? wrapper,
  }) : _wrapper = wrapper ?? RequestWrapper(AppClient.instance);

  @override
  Future<NameModel> getNameIfItExist(
    String usernameOrEmailOrPhoneNumber,
  ) async {
    try {
      final response = await _wrapper
          .get('/auth/info/$usernameOrEmailOrPhoneNumber', header: {
        AppHeader.deviceType: DeviceHelper.deviceType(),
        AppHeader.deviceId: DeviceHelper.deviceId(),
      });
      return NameModel.fromJson(response['data']);
    } catch (_) {
      rethrow;
    }
  }
}
