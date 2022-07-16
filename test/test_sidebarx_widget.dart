import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class TestSidebarX extends StatelessWidget {
  const TestSidebarX({
    Key? key,
    required this.controller,
    required this.items,
    this.toggleButtonBuilder,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  final SidebarXController controller;
  final List<SidebarXItem> items;
  final SidebarXBuilder? toggleButtonBuilder;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX test app',
      home: Scaffold(
        body: SidebarX(
          animationDuration: animationDuration,
          controller: controller,
          items: items,
          toggleButtonBuilder: toggleButtonBuilder,
        ),
      ),
    );
  }
}
