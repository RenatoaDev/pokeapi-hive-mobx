import 'package:pokeapi_project/utils/strings.dart';

class DetailsTranslations {
  static const Map<String, String> statTranslations = {
    'hp': Strings.hpText,
    'attack': Strings.attackText,
    'defense': Strings.defenseText,
    'special-attack': Strings.specialAttackText,
    'special-defense': Strings.specialDefenseText,
    'speed': Strings.speedText,
  };

  static const Map<String, String> typeTranslations = {
    'normal': Strings.normalTypeText,
    'fighting': Strings.fightingTypeText,
    'flying': Strings.flyingTypeText,
    'poison': Strings.poisonTypeText,
    'ground': Strings.groundTypeText,
    'rock': Strings.rockTypeText,
    'bug': Strings.bugTypeText,
    'ghost': Strings.ghostTypeText,
    'steel': Strings.steelTypeText,
    'fire': Strings.fireTypeText,
    'water': Strings.waterTypeText,
    'grass': Strings.grassTypeText,
    'electric': Strings.electricTypeText,
    'psychic': Strings.psychicTypeText,
    'ice': Strings.iceTypeText,
    'dragon': Strings.dragonTypeText,
    'dark': Strings.darkTypeText,
    'fairy': Strings.fairyTypeText,
    'unknown': Strings.unknownTypeText,
    'shadow': Strings.shadowTypeText,
  };

  static String translateStat(String statName) {
    return statTranslations[statName] ?? statName;
  }

  static String translateType(String typeName) {
    return typeTranslations[typeName] ?? typeName;
  }

  static String translateHeight(int height) {
    return '${height / 10} m';
  }

  static String translateWeight(int weight) {
    return '${weight / 10} kg';
  }
}
