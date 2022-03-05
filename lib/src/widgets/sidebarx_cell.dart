import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarXCell extends StatelessWidget {
  const SidebarXCell({
    Key? key,
    required this.item,
    required this.extended,
    required this.selected,
    required this.theme,
  }) : super(key: key);

  final bool extended;
  final bool selected;
  final SidebarXItem item;
  final SidebarXTheme theme;

  @override
  Widget build(BuildContext context) {
    final iconTheme = selected ? theme.selectedIconTheme : theme.iconTheme;
    final textStyle = selected ? theme.selectedTextStyle : theme.textStyle;
    final decoration =
        selected ? theme.selectedItemDecoration : theme.decoration;
    return Container(
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(flex: 4, child: _Icon(item: item, iconTheme: iconTheme)),
          if (extended)
            Flexible(flex: 6, child: Text(item.label ?? '', style: textStyle)),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    Key? key,
    required this.item,
    required this.iconTheme,
  }) : super(key: key);

  final SidebarXItem item;
  final IconThemeData? iconTheme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        item.icon,
        color: iconTheme?.color,
        size: iconTheme?.size,
      ),
      onPressed: () {
        item.onTap?.call();
      },
    );
  }
}
