import 'package:flutter/material.dart';

class SidebarXTheme {
  const SidebarXTheme({
    this.width = 70,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.decoration = const BoxDecoration(),
  });

  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxDecoration decoration;
}
