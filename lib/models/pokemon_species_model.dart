class PokemonSpeciesModel {
  int baseHappiness;
  int captureRate;
  Map<String, dynamic> color;
  List<dynamic> eggGroups;
  Map<String, dynamic> evolutionChain;
  Map<String, dynamic> evolvesFromSpecies;
  List<dynamic> flavorTextEntries;
  Map<String, dynamic> formDescriptions;
  bool formsSwitchable;
  int genderRate;
  List<dynamic> genera;
  Map<String, dynamic> generation;
  Map<String, dynamic> growthRate;
  Map<String, dynamic> habitat;
  bool hasGenderDifferences;
  int hatchCounter;
  int id;
  bool isBaby;
  bool isLegendary;
  bool isMythical;
  String name;
  List<dynamic> names;
  int order;
  List<dynamic> palParkEncounters;
  List<dynamic> pokedexNumbers;
  Map<String, dynamic> shape;
  List<dynamic> varieties;

  PokemonSpeciesModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesModel(
      baseHappiness: json['base_happiness'],
      captureRate: json['capture_rate'],
      color: json['color'],
      eggGroups: json['egg_groups'],
      evolutionChain: json['evolution_chain'],
      evolvesFromSpecies: json['evolves_from_species'],
      flavorTextEntries: json['flavor_text_entries'],
      formDescriptions: json['form_descriptions'],
      formsSwitchable: json['forms_switchable'],
      genderRate: json['gender_rate'],
      genera: json['genera'],
      generation: json['generation'],
      growthRate: json['growth_rate'],
      habitat: json['habitat'],
      hasGenderDifferences: json['has_gender_differences'],
      hatchCounter: json['hatch_counter'],
      id: json['id'],
      isBaby: json['is_baby'],
      isLegendary: json['is_legendary'],
      isMythical: json['is_mythical'],
      name: json['name'],
      names: json['names'],
      order: json['order'],
      palParkEncounters: json['pal_park_encounters'],
      pokedexNumbers: json['pokedex_numbers'],
      shape: json['shape'],
      varieties: json['varieties'],
    );
  }
}
