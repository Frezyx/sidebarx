import 'package:flutter/cupertino.dart';

class SidebarXItem {
  const SidebarXItem({
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final Function()? onTap;
}
