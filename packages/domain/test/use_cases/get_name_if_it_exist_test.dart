import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:domain/repository/authentication_repository.dart';
import 'package:domain/use_cases/get_name_if_it_exist.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'get_name_if_it_exist_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  late AuthenticationRepository authenticationRepository;
  late GetNameIfItExist useCase;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    useCase = GetNameIfItExist(authenticationRepository);
  });

  final qName = 'some';
  final tName = NameEntity('Some');

  test(
    'should get the name if it exist from the repository',
    () async {
      // arrange
      when(authenticationRepository.getNameIfItExist(qName))
          .thenAnswer((_) async => Right(tName));
      // act
      final result = await useCase.execute(qName);
      // assert
      expect(result, Right(tName));
      verify(authenticationRepository.getNameIfItExist(qName));
      verifyNoMoreInteractions(authenticationRepository);
    },
  );
}
