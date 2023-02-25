import 'package:data/core/platform/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfo;
  late InternetConnectionChecker connectionChecker;

  setUp(() {
    connectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(connectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to InternetConnectionChecker.hasConnection',
      () async {
        final tHasConnection = Future.value(true);

        when(connectionChecker.hasConnection).thenAnswer((_) => tHasConnection);

        final result = networkInfo.isConnected;

        verify(connectionChecker.hasConnection);
        expect(result, tHasConnection);
      },
    );
  });
}
