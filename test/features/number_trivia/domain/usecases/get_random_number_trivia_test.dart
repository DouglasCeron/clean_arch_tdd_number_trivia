import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'get_concrete_number_trivia_test.mocks.dart';
import 'package:clean_arch_tdd_number_trivia/core/usecases/usecase.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
void main() {
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumbertriviaRepository;

  setUp(() {
    mockNumbertriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumbertriviaRepository!);
  });

  final tnumberTrivia = NumberTrivia(number: 1, text: ' test');

  test('Should get trivia from the repository', () async {
    //arrange
    when(mockNumbertriviaRepository?.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tnumberTrivia));
    // act
    final result = await usecase!(NoParams());
    //assert
    expect(result, Right(tnumberTrivia));
    verify(mockNumbertriviaRepository?.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumbertriviaRepository);
  });
}
