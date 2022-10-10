import 'package:clean_arch_tdd_number_trivia/core/platform/network_info.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:clean_arch_tdd_number_trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NumberTriviaLocalDatasource>(),
  MockSpec<NumberTriviaRemoteDatasource>(),
  MockSpec<NetworkInfo>(),
])
void main() {
  NumberTriviaRepositoryImpl repository;
  MockNumberTriviaLocalDatasource mockLocalDatasource;
  MockNumberTriviaRemoteDatasource mockRemoteDatasource;
  MockNetworkInfo mockNetworkInfo;

  setUp(
    () {
      mockLocalDatasource = MockNumberTriviaLocalDatasource();
      mockRemoteDatasource = MockNumberTriviaRemoteDatasource();
      mockNetworkInfo = MockNetworkInfo();
      repository = NumberTriviaRepositoryImpl(
        localDatasource: mockLocalDatasource,
        remoteDatasource: mockRemoteDatasource,
        networkInfo: mockNetworkInfo,
      );
    },
  );
}
