import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarX extends StatelessWidget {
  const SidebarX({
    Key? key,
    required this.controller,
    this.items = const [],
    this.theme = const SidebarXTheme(),
    this.extendedTheme = const SidebarXTheme(),
  }) : super(key: key);

  final SidebarXTheme theme;
  final SidebarXTheme extendedTheme;
  final List<SidebarXItem> items;
  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: controller.extended ? extendedTheme.width : theme.width,
          height: double.infinity,
          padding: controller.extended ? extendedTheme.padding : theme.padding,
          margin: controller.extended ? extendedTheme.margin : theme.margin,
          decoration:
              controller.extended ? extendedTheme.decoration : theme.decoration,
          child: Column(
            children: [
              // Container(
              //   height: 200,
              //   color: Colors.red,
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return IconButton(
                      icon: Icon(item.icon),
                      onPressed: () {
                        item.onTap?.call();
                      },
                    );
                  },
                ),
              ),
              // Container(
              //   height: 200,
              //   color: Colors.green,
              // ),
            ],
          ),
        );
      },
    );
  }
}
