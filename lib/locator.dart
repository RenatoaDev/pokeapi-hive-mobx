import 'package:get_it/get_it.dart';
import 'package:pokeapi_project/pages/details/store/details_store.dart';
import 'package:pokeapi_project/pages/home/store/home_store.dart';
import 'package:pokeapi_project/pages/initial/store/initial_store.dart';
import 'package:pokeapi_project/repositories/details_repository.dart';
import 'package:pokeapi_project/repositories/home_repository.dart';
import 'package:pokeapi_project/services/api_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<DetailsRepository>(
      () => DetailsRepository(getIt()));

  getIt.registerFactory<InitialStore>(() => InitialStore());
  getIt.registerFactory<HomeStore>(() => HomeStore());
  getIt.registerFactory<DetailsStore>(() => DetailsStore());
}
