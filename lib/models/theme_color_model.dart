import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'theme_color_model.g.dart';

@HiveType(typeId: 0)
class ThemeColorModel extends HiveObject {
  @HiveField(0)
  Color primaryColor;

  ThemeColorModel({required this.primaryColor});
}
