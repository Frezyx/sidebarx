import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarX extends StatelessWidget {
  const SidebarX({
    Key? key,
    required this.controller,
    this.items = const [],
    this.theme = const SidebarXTheme(),
    this.extendedTheme,
    this.headerBuilder,
    this.footerBuilder,
  }) : super(key: key);

  final SidebarXTheme theme;

  /// Theme of extended sidebar
  /// Using [theme] if [extendedTheme] is null
  final SidebarXTheme? extendedTheme;
  final List<SidebarXItem> items;
  final SidebarXController controller;

  final Widget Function(BuildContext context, bool extended)? headerBuilder;
  final Widget Function(BuildContext context, bool extended)? footerBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final selectedTheme =
            controller.extended ? extendedTheme ?? theme : theme;
        final t = selectedTheme.mergeFlutterTheme(context);

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: t.width,
          height: t.height,
          padding: t.padding,
          margin: t.margin,
          decoration: t.decoration,
          child: Column(
            children: [
              headerBuilder?.call(context, controller.extended) ??
                  const SizedBox(),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return SidebarXCell(
                      item: item,
                      theme: t,
                      extended: controller.extended,
                      selected: controller.selectedIndex == index,
                    );
                  },
                ),
              ),
              footerBuilder?.call(context, controller.extended) ??
                  const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
