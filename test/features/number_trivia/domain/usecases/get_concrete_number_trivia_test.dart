import 'package:clean_arch_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumbertriviaRepository;

  setUp(() {
    mockNumbertriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(repository: mockNumbertriviaRepository!);
  });

  final tNumber = 1;
  final tnumberTrivia = NumberTrivia(number: 1, text: ' test');

  test('Should bring the data from the repository', () async {
    //arrange
    when(mockNumbertriviaRepository?.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tnumberTrivia));
    // act
    final result = await usecase!(number: tNumber);
    //assert
    expect(result, Right(tnumberTrivia));
    verify(mockNumbertriviaRepository?.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumbertriviaRepository);
  });
}
