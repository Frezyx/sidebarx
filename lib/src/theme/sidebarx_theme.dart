import 'package:flutter/material.dart';

class SidebarXTheme {
  const SidebarXTheme({
    this.width = 70,
    this.height = double.infinity,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.decoration,
    this.iconTheme,
    this.selectedIconTheme,
    this.textStyle,
    this.selectedTextStyle,
    this.itemDecoration,
    this.selectedItemDecoration,
  });

  final double width;
  final double height;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxDecoration? decoration;

  final IconThemeData? iconTheme;
  final IconThemeData? selectedIconTheme;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final BoxDecoration? itemDecoration;
  final BoxDecoration? selectedItemDecoration;

  /// Method to get default flutter theme settings
  SidebarXTheme mergeFlutterTheme(BuildContext context) {
    final theme = Theme.of(context);
    return SidebarXTheme(
      width: width,
      padding: padding,
      margin: margin,
      decoration: decoration ?? BoxDecoration(color: theme.cardColor),
    );
  }

  SidebarXTheme copyWith({
    double? width,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxDecoration? decoration,
  }) {
    return SidebarXTheme(
      width: width ?? this.width,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      decoration: decoration ?? this.decoration,
    );
  }
}
