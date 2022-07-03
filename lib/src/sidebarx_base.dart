import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarX extends StatefulWidget {
  const SidebarX({
    Key? key,
    required this.controller,
    this.items = const [],
    this.theme = const SidebarXTheme(),
    this.extendedTheme,
    this.headerBuilder,
    this.footerBuilder,
    this.separatorBuilder,
    this.toggleButtonBuilder,
    this.showToggleButton = true,
    this.headerDivider,
    this.footerDivider,
    this.animationDuration = 300,
  }) : super(key: key);

  final SidebarXTheme theme;

  /// Theme of extended sidebar
  /// Using [theme] if [extendedTheme] is null
  final SidebarXTheme? extendedTheme;
  final List<SidebarXItem> items;
  final SidebarXController controller;

  final IndexedWidgetBuilder? separatorBuilder;
  final SidebarXBuilder? headerBuilder;
  final SidebarXBuilder? footerBuilder;
  final SidebarXBuilder? toggleButtonBuilder;

  final bool showToggleButton;

  final Widget? headerDivider;
  final Widget? footerDivider;

  final int animationDuration;

  @override
  State<SidebarX> createState() => _SidebarXState();
}

class _SidebarXState extends State<SidebarX>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );
    if (widget.controller.extended) {
      _animationController.forward();
    }
    widget.controller.extendStream.listen(
      (extended) {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final extendedT = widget.extendedTheme?.mergeWith(widget.theme);
        final selectedTheme = widget.controller.extended
            ? extendedT ?? widget.theme
            : widget.theme;

        final t = selectedTheme.mergeFlutterTheme(context);

        return AnimatedContainer(
          duration: Duration(milliseconds: widget.animationDuration),
          width: t.width,
          height: t.height,
          padding: t.padding,
          margin: t.margin,
          decoration: t.decoration,
          child: Column(
            children: [
              widget.headerBuilder?.call(context, widget.controller.extended) ??
                  const SizedBox(),
              widget.headerDivider ?? const SizedBox(),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.items.length,
                  separatorBuilder: widget.separatorBuilder ??
                      (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    return SidebarXCell(
                      item: item,
                      theme: t,
                      animationController: _animationController,
                      extended: widget.controller.extended,
                      selected: widget.controller.selectedIndex == index,
                      onTap: () {
                        item.onTap?.call();
                        widget.controller.selectIndex(index);
                      },
                    );
                  },
                ),
              ),
              widget.footerDivider ?? const SizedBox(),
              widget.footerBuilder?.call(context, widget.controller.extended) ??
                  const SizedBox(),
              if (widget.showToggleButton) _buildToggleButton(t),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToggleButton(SidebarXTheme sidebarXTheme) {
    final buildedToggleButton =
        widget.toggleButtonBuilder?.call(context, widget.controller.extended);
    if (buildedToggleButton != null) {
      return buildedToggleButton;
    }

    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        widget.controller.toggleExtended();
      },
      child: Row(
        mainAxisAlignment: widget.controller.extended
            ? MainAxisAlignment.end
            : MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(
              widget.controller.extended
                  ? Icons.arrow_back_ios_new
                  : Icons.arrow_forward_ios,
              color: sidebarXTheme.iconTheme?.color,
              size: sidebarXTheme.iconTheme?.size,
            ),
          ),
        ],
      ),
    );
  }
}
