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
    this.itemMargin,
    this.selectedItemMargin,
    this.itemPadding,
    this.selectedItemPadding,
    this.itemTextPadding,
    this.selectedItemTextPadding,
    this.hoverColor,
    this.hoverTextStyle,
  });

  /// [SidebarX] width
  final double width;

  /// [SidebarX] height
  final double height;

  /// [SidebarX] padding
  final EdgeInsets padding;

  /// [SidebarX] margin
  final EdgeInsets margin;

  /// [SidebarX] decoration
  final BoxDecoration? decoration;

  /// Unselected [SidebarXItem] icons theme
  final IconThemeData? iconTheme;

  /// Selected [SidebarXItem] icon theme
  final IconThemeData? selectedIconTheme;

  /// Unselected [SidebarXItem] text style
  final TextStyle? textStyle;

  /// Selected [SidebarXItem] text  style
  final TextStyle? selectedTextStyle;

  /// Unselected item [SidebarXItem] decoration
  final BoxDecoration? itemDecoration;

  /// Selected item [SidebarXItem] decoration
  final BoxDecoration? selectedItemDecoration;

  /// Unselected item [SidebarXItem] marging
  final EdgeInsets? itemMargin;

  /// Selected item [SidebarXItem] marging
  final EdgeInsets? selectedItemMargin;

  /// Unselected item [SidebarXItem] padding
  final EdgeInsets? itemPadding;

  /// Selected item [SidebarXItem] padding
  final EdgeInsets? selectedItemPadding;

  /// Unselected item [SidebarXItem] text padding
  final EdgeInsets? itemTextPadding;

  /// Selected item [SidebarXItem] text padding
  final EdgeInsets? selectedItemTextPadding;

  /// Background color of [SidebarXItem] when the mouse
  /// cursor hover over an item
  final Color? hoverColor;

  /// [SidebarXItem] text  style  when the mouse
  /// cursor hover over an item
  final TextStyle? hoverTextStyle;

  /// Method to get default flutter theme settings
  SidebarXTheme mergeFlutterTheme(BuildContext context) {
    final theme = Theme.of(context);
    final mergedTheme = SidebarXTheme(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ?? BoxDecoration(color: theme.cardColor),
      iconTheme: iconTheme ?? theme.iconTheme,
      selectedIconTheme: selectedIconTheme ??
          theme.iconTheme.copyWith(color: theme.primaryColor),
      textStyle: textStyle ?? theme.textTheme.bodyMedium,
      selectedTextStyle: selectedTextStyle ??
          theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
      itemDecoration: itemDecoration,
      selectedItemDecoration: selectedItemDecoration,
      itemMargin: itemMargin,
      selectedItemMargin: selectedItemMargin,
      itemPadding: itemPadding,
      selectedItemPadding: selectedItemPadding,
      itemTextPadding: itemTextPadding,
      selectedItemTextPadding: selectedItemTextPadding,
      hoverColor: hoverColor ?? theme.hoverColor,
      hoverTextStyle: hoverTextStyle ??
          theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
    );
    return mergedTheme;
  }

  /// Merges two themes together
  SidebarXTheme mergeWith(
    SidebarXTheme theme,
  ) {
    return SidebarXTheme(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      itemTextPadding: itemTextPadding ?? theme.itemTextPadding,
      selectedItemTextPadding:
          selectedItemTextPadding ?? theme.selectedItemTextPadding,
      decoration: decoration ?? theme.decoration,
      iconTheme: iconTheme ?? theme.iconTheme,
      selectedIconTheme: selectedIconTheme ?? theme.selectedIconTheme,
      textStyle: textStyle ?? theme.textStyle,
      selectedTextStyle: selectedTextStyle ?? theme.selectedTextStyle,
      itemMargin: itemMargin ?? theme.itemMargin,
      selectedItemMargin: selectedItemMargin ?? theme.selectedItemMargin,
      itemPadding: itemPadding ?? theme.itemPadding,
      selectedItemPadding: selectedItemPadding ?? theme.selectedItemPadding,
      itemDecoration: itemDecoration ?? theme.itemDecoration,
      selectedItemDecoration:
          selectedItemDecoration ?? theme.selectedItemDecoration,
      hoverColor: hoverColor ?? theme.hoverColor,
      hoverTextStyle: hoverTextStyle ?? theme.hoverTextStyle,
    );
  }

  /// Defautl copyWith method
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
    EdgeInsets? itemMargin,
    EdgeInsets? selectedItemMargin,
    EdgeInsets? itemPadding,
    EdgeInsets? selectedItemPadding,
    EdgeInsets? itemTextPadding,
    EdgeInsets? selectedItemTextPadding,
    Color? hoverColor,
    TextStyle? hoverTextStyle,
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
      itemMargin: itemMargin ?? this.itemMargin,
      selectedItemMargin: selectedItemMargin ?? this.selectedItemMargin,
      itemPadding: itemPadding ?? this.itemPadding,
      selectedItemPadding: selectedItemPadding ?? this.selectedItemPadding,
      itemTextPadding: itemTextPadding ?? this.itemTextPadding,
      selectedItemTextPadding:
          selectedItemTextPadding ?? this.selectedItemTextPadding,
      hoverColor: hoverColor ?? this.hoverColor,
      hoverTextStyle: hoverTextStyle ?? this.hoverTextStyle,
    );
  }
}
