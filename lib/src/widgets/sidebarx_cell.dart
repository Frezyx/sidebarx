import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarXCell extends StatefulWidget {
  const SidebarXCell({
    Key? key,
    required this.item,
    required this.extended,
    required this.selected,
    required this.theme,
    required this.onTap,
    required this.animationController,
  }) : super(key: key);

  final bool extended;
  final bool selected;
  final SidebarXItem item;
  final SidebarXTheme theme;
  final VoidCallback onTap;
  final AnimationController animationController;

  @override
  State<SidebarXCell> createState() => _SidebarXCellState();
}

class _SidebarXCellState extends State<SidebarXCell> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;
    final iconTheme =
        widget.selected ? theme.selectedIconTheme : theme.iconTheme;
    final textStyle =
        widget.selected ? theme.selectedTextStyle : theme.textStyle;
    final decoration =
        widget.selected ? theme.selectedItemDecoration : theme.itemDecoration;
    final textPadding =
        widget.selected ? theme.selectedItemTextPadding : theme.itemTextPadding;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: decoration,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: widget.extended
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                final value = ((1 - _animation.value) * 6).toInt();
                if (value <= 0) {
                  return const SizedBox();
                }
                return Spacer(flex: value);
              },
            ),
            _Icon(item: widget.item, iconTheme: iconTheme),
            Flexible(
              flex: 6,
              child: FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: textPadding ?? EdgeInsets.zero,
                  child: Text(
                    widget.item.label ?? '',
                    style: textStyle,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
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
    return Icon(
      item.icon,
      color: iconTheme?.color,
      size: iconTheme?.size,
    );
  }
}
