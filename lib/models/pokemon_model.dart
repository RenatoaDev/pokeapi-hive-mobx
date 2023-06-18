import 'package:hive/hive.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 1)
class PokemonModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;

  DateTime addedDate = DateTime.now();

  PokemonModel({
    required this.name,
    required this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
