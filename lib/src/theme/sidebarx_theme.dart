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
    this.selectedHoverColor,
    this.splashColor,
    this.selectedSplashColor,
    this.highlightColor,
    this.selectedHighlightColor,
    this.focusColor,
    this.selectedFocusColor,
  });

  /// [SidebarX] width
  final double width;

  /// [SidebarX] height
  final double height;

  /// [SidebarX] padding
  final EdgeInsetsGeometry padding;

  /// [SidebarX] margin
  final EdgeInsetsGeometry margin;

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
  final EdgeInsetsGeometry? itemMargin;

  /// Selected item [SidebarXItem] marging
  final EdgeInsetsGeometry? selectedItemMargin;

  /// Unselected item [SidebarXItem] padding
  final EdgeInsetsGeometry? itemPadding;

  /// Selected item [SidebarXItem] padding
  final EdgeInsetsGeometry? selectedItemPadding;

  /// Unselected item [SidebarXItem] text padding
  final EdgeInsetsGeometry? itemTextPadding;

  /// Selected item [SidebarXItem] text padding
  final EdgeInsetsGeometry? selectedItemTextPadding;

  /// Background color of [SidebarXItem] when the mouse
  /// cursor hover over an item
  final Color? hoverColor;

  /// Background color of [SidebarXItem] when the mouse
  /// cursor hover over a selected item
  final Color? selectedHoverColor;

  /// Unselected item splash color of [SidebarXItem]
  final Color? splashColor;

  /// Selected item splash color of [SidebarXItem]
  final Color? selectedSplashColor;

  /// [SidebarXItem] text  style  when the mouse
  /// cursor hover over an item
  final TextStyle? hoverTextStyle;

  /// Unselected item highlight color of [SidebarXItem]'s InkWell
  final Color? highlightColor;

  /// Selected item highlight color of [SidebarXItem]'s InkWell
  final Color? selectedHighlightColor;

  /// Unselected item focus color of [SidebarXItem]
  final Color? focusColor;

  /// Selected item focus color of [SidebarXItem]
  final Color? selectedFocusColor;

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
      selectedHoverColor: selectedHoverColor ?? theme.hoverColor,
      hoverTextStyle: hoverTextStyle ??
          theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
      splashColor: splashColor ?? theme.splashColor,
      selectedSplashColor: selectedSplashColor ?? theme.splashColor,
      highlightColor: highlightColor ?? theme.highlightColor,
      selectedHighlightColor: selectedHighlightColor ?? theme.highlightColor,
      focusColor: focusColor ?? theme.focusColor,
      selectedFocusColor: selectedFocusColor ?? theme.focusColor,
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
      selectedHoverColor: selectedHoverColor ?? theme.selectedHoverColor,
      splashColor: splashColor ?? theme.splashColor,
      selectedSplashColor: selectedSplashColor ?? theme.selectedSplashColor,
      hoverTextStyle: hoverTextStyle ?? theme.hoverTextStyle,
      highlightColor: highlightColor ?? theme.highlightColor,
      selectedHighlightColor:
          selectedHighlightColor ?? theme.selectedHighlightColor,
      focusColor: focusColor ?? theme.focusColor,
      selectedFocusColor: selectedFocusColor ?? theme.selectedFocusColor,
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
    Color? selectedHoverColor,
    Color? splashColor,
    Color? selectedSplashColor,
    TextStyle? hoverTextStyle,
    Color? highlightColor,
    Color? selectedHighlightColor,
    Color? focusColor,
    Color? selectedFocusColor,
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
      selectedHoverColor: selectedHoverColor ?? this.selectedHoverColor,
      splashColor: splashColor ?? this.splashColor,
      selectedSplashColor: selectedSplashColor ?? this.selectedSplashColor,
      hoverTextStyle: hoverTextStyle ?? this.hoverTextStyle,
      highlightColor: highlightColor ?? this.highlightColor,
      selectedHighlightColor:
          selectedHighlightColor ?? this.selectedHighlightColor,
      focusColor: focusColor ?? this.focusColor,
      selectedFocusColor: selectedFocusColor ?? this.selectedFocusColor,
    );
  }
}
