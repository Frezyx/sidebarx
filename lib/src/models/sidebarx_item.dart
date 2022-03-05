import 'package:flutter/cupertino.dart';

class SidebarXItem {
  const SidebarXItem({
    required this.icon,
    this.label,
    this.onTap,
  });

  final IconData icon;
  final String? label;
  final Function()? onTap;
}
