class EvolutionChainModel {
  NamedResource species;
  List<EvolutionChainModel> evolvesTo;
  bool isBaby;

  EvolutionChainModel({
    required this.species,
    required this.evolvesTo,
    required this.isBaby,
  });

  factory EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    return EvolutionChainModel(
      species: NamedResource.fromJson(json['species']),
      evolvesTo: List<EvolutionChainModel>.from(
          json['evolves_to'].map((x) => EvolutionChainModel.fromJson(x))),
      isBaby: json['is_baby'],
    );
  }
}

class NamedResource {
  String name;
  String url;

  NamedResource({
    required this.name,
    required this.url,
  });

  factory NamedResource.fromJson(Map<String, dynamic> json) {
    return NamedResource(
      name: json['name'],
      url: json['url'],
    );
  }
}
