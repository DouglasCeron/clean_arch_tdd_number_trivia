import 'package:clean_arch_tdd_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDatasource {
  ///Calls the hattp://numbersapi.com/{number} endpoint
  ///
  ///Throws a [serverException] for all error codes
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  ///Calss the hattp://numbersapi.com/random endpoint
  ///
  ///Throws a [serverException] for all error codes
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
