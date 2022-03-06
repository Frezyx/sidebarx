import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final SidebarXTheme theme;

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 10,
      indent: 10,
      color: theme.iconTheme?.color?.withOpacity(0.2),
      height: 1,
    );
  }
}
