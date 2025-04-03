import 'package:flutter/material.dart';

const _customColor = Color(0xff49149f);

const List<Color> _colorSeeds = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColorSeed;

  AppTheme({required this.selectedColorSeed})
    : assert(
        selectedColorSeed >= 0 && selectedColorSeed < _colorSeeds.length,
        'Colors must be between 0 and ${_colorSeeds.length}',
      );

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorSeeds[selectedColorSeed]);
  }
}
