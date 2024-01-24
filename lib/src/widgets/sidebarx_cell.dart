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
    required this.onLongPress,
    required this.onSecondaryTap,
    required this.animationController,
  }) : super(key: key);

  final bool extended;
  final bool selected;
  final SidebarXItem item;
  final SidebarXTheme theme;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onSecondaryTap;
  final AnimationController animationController;

  @override
  State<SidebarXCell> createState() => _SidebarXCellState();
}

class _SidebarXCellState extends State<SidebarXCell> {
  late Animation<double> _animation;
  var _hovered = false;

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
    final textStyle = widget.selected
        ? theme.selectedTextStyle
        : (_hovered)
            ? theme.hoverTextStyle
            : theme.textStyle;
    final decoration =
        (widget.selected ? theme.selectedItemDecoration : theme.itemDecoration);
    final margin =
        (widget.selected ? theme.selectedItemMargin : theme.itemMargin);
    final padding =
        (widget.selected ? theme.selectedItemPadding : theme.itemPadding);
    final textPadding =
        widget.selected ? theme.selectedItemTextPadding : theme.itemTextPadding;
    final splashColor =
        widget.selected ? theme.selectedSplashColor : theme.splashColor;
    final highlightColor =
        widget.selected ? theme.selectedHighlightColor : theme.highlightColor;
    final focusColor =
        widget.selected ? theme.selectedFocusColor : theme.focusColor;

    return Container(
      decoration: decoration,
      margin: margin ?? const EdgeInsets.all(4),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: decoration?.borderRadius,
        child: InkWell(
          focusColor: focusColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          borderRadius:
              decoration?.borderRadius?.resolve(Directionality.of(context)),
          hoverColor:
              widget.selected ? theme.selectedHoverColor : theme.hoverColor,
          onHover: (value) {
            if (value) {
              _onEnteredCellZone();
            } else {
              _onExitCellZone();
            }
          },
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          onSecondaryTap: widget.onSecondaryTap,
          child: Container(
            padding: padding ?? const EdgeInsets.all(8),
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
                if (widget.item.icon != null)
                  _Icon(item: widget.item, iconTheme: iconTheme)
                else if (widget.item.iconWidget != null)
                  widget.item.iconWidget!,
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
        ),
      ),
    );
  }

  void _onEnteredCellZone() {
    setState(() => _hovered = true);
  }

  void _onExitCellZone() {
    setState(() => _hovered = false);
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
