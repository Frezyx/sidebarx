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
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ?? BoxDecoration(color: theme.cardColor),
      iconTheme: iconTheme ?? theme.iconTheme,
      selectedIconTheme:
          iconTheme ?? theme.iconTheme.copyWith(color: theme.primaryColor),
      textStyle: textStyle ?? theme.textTheme.bodyMedium,
      selectedTextStyle: selectedTextStyle ??
          theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
      itemDecoration: itemDecoration,
      selectedItemDecoration: selectedItemDecoration,
    );
  }

  SidebarXTheme mergeWith(
    SidebarXTheme theme,
  ) {
    return SidebarXTheme(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ?? theme.decoration,
      iconTheme: iconTheme ?? theme.iconTheme,
      selectedIconTheme: selectedIconTheme ?? theme.selectedIconTheme,
      textStyle: textStyle ?? theme.textStyle,
      selectedTextStyle: selectedTextStyle ?? theme.selectedTextStyle,
      itemDecoration: itemDecoration ?? theme.itemDecoration,
      selectedItemDecoration:
          selectedItemDecoration ?? theme.selectedItemDecoration,
    );
  }

  SidebarXTheme copyWith({
    double? width,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxDecoration? decoration,
    IconThemeData? iconTheme,
    IconThemeData? selectedIconTheme,
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
    BoxDecoration? itemDecoration,
    BoxDecoration? selectedItemDecoration,
  }) {
    return SidebarXTheme(
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      decoration: decoration ?? this.decoration,
      iconTheme: iconTheme ?? this.iconTheme,
      selectedIconTheme: selectedIconTheme ?? this.selectedIconTheme,
      textStyle: textStyle ?? this.textStyle,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      itemDecoration: itemDecoration ?? this.itemDecoration,
      selectedItemDecoration:
          selectedItemDecoration ?? this.selectedItemDecoration,
    );
  }
}
