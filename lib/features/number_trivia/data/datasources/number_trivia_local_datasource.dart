import 'package:clean_arch_tdd_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDatasource {
  ///Gets the cached [NumberTriviaModel] wich was gotten the last time
  ///the user had an internet conncection
  ///
  ///Throws [CachedException] if no cached data is present
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<bool>? cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
