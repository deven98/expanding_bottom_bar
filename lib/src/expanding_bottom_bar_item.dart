import 'package:flutter/material.dart';

/// An item in the ExpandingBottomBar
class ExpandingBottomBarItem {
  /// Icon to be displayed in the BottomNavigationBar
  IconData icon;

  /// Title of the item
  String text;

  /// The color of the selected item
  Color selectedColor;

  ExpandingBottomBarItem({
    required this.icon,
    required this.text,
    required this.selectedColor,
  });
}
