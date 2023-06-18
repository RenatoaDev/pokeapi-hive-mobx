class PokemonDetailsModel {
  int id;
  List<Ability> abilities;
  int baseExperience;
  String name;
  Sprites sprites;
  List<Stat> stats;
  List<PokemonType> types;
  int height;
  int weight;

  PokemonDetailsModel({
    required this.id,
    required this.abilities,
    required this.baseExperience,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.height,
    required this.weight,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      id: json['id'],
      abilities:
          List<Ability>.from(json['abilities'].map((x) => Ability.fromJson(x))),
      baseExperience: json['base_experience'],
      name: json['name'],
      sprites: Sprites.fromJson(json['sprites']),
      stats: List<Stat>.from(json['stats'].map((x) => Stat.fromJson(x))),
      types: List<PokemonType>.from(
          json['types'].map((x) => PokemonType.fromJson(x))),
      height: json['height'],
      weight: json['weight'],
    );
  }
}

class Ability {
  NamedResource ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      ability: NamedResource.fromJson(json['ability']),
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}

class Sprites {
  OtherSprites other;

  Sprites({
    required this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      other: OtherSprites.fromJson(json['other']),
    );
  }
}

class OtherSprites {
  HomeSprites home;
  OfficialArtwork officialArtwork;

  OtherSprites({
    required this.home,
    required this.officialArtwork,
  });

  factory OtherSprites.fromJson(Map<String, dynamic> json) {
    return OtherSprites(
      home: HomeSprites.fromJson(json['home']),
      officialArtwork: OfficialArtwork.fromJson(json['official-artwork']),
    );
  }
}

class OfficialArtwork {
  String frontDefault;

  OfficialArtwork({
    required this.frontDefault,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(
      frontDefault: json['front_default'],
    );
  }
}

class HomeSprites {
  String frontDefault;

  HomeSprites({
    required this.frontDefault,
  });

  factory HomeSprites.fromJson(Map<String, dynamic> json) {
    return HomeSprites(
      frontDefault: json['front_default'],
    );
  }
}

class Stat {
  int baseStat;
  int effort;
  StatDetail stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: StatDetail.fromJson(json['stat']),
    );
  }
}

class StatDetail {
  String name;
  String url;

  StatDetail({
    required this.name,
    required this.url,
  });

  factory StatDetail.fromJson(Map<String, dynamic> json) {
    return StatDetail(
      name: json['name'],
      url: json['url'],
    );
  }
}

class PokemonType {
  int slot;
  NamedResource type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      type: NamedResource.fromJson(json['type']),
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
