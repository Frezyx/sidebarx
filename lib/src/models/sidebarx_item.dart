import 'package:flutter/cupertino.dart';

class SidebarXItem {
  const SidebarXItem({
    this.label,
    this.icon,
    this.iconWidget,
    this.onTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.selectable = true,
  }) : assert(
          (icon != null || iconWidget != null) &&
              (icon == null || iconWidget == null),
          'You can create SidebarXItem with IconData? icon or with Widget? iconWidget',
        );

  final String? label;
  final IconData? icon;
  final Widget? iconWidget;
  final bool selectable;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onSecondaryTap;
}
