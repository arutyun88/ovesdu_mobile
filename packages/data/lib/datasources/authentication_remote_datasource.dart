import 'package:data/models/name_model.dart';

abstract class AuthenticationRemoteDatasource {
  /// Calls the /auth/info/{[usernameOrEmailOrPhoneNumber]} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<NameModel> getNameIfItExist(String usernameOrEmailOrPhoneNumber);
}
