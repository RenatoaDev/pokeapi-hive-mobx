import 'package:mockito/mockito.dart';
import 'package:pokeapi_project/repositories/home_repository.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

final mockHomeRepository = MockHomeRepository();
