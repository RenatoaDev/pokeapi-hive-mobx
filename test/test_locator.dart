import 'package:get_it/get_it.dart';
import 'package:pokeapi_project/pages/details/store/details_store.dart';
import 'package:pokeapi_project/pages/home/store/home_store.dart';
import 'package:pokeapi_project/repositories/details_repository.dart';
import 'package:pokeapi_project/repositories/home_repository.dart';
import 'package:pokeapi_project/services/api_service.dart';
import 'mock_home_repository.dart';
import 'test_api_service.dart';

final GetIt testGetIt = GetIt.instance;

void setupTestLocator() {
  testGetIt.registerLazySingleton<ApiService>(() => TestApiService());
  testGetIt.registerSingleton<HomeRepository>(mockHomeRepository);
  testGetIt.registerLazySingleton<DetailsRepository>(
      () => DetailsRepository(testGetIt()));
  testGetIt.registerFactory<HomeStore>(() => HomeStore());
  testGetIt.registerFactory<DetailsStore>(() => DetailsStore());
}
