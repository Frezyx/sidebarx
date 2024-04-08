import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sidebarx/src/widgets/widgets.dart';

class SidebarX extends StatefulWidget {
  const SidebarX({
    Key? key,
    required this.controller,
    this.items = const [],
    this.footerItems = const [],
    this.theme = const SidebarXTheme(),
    this.extendedTheme,
    this.headerBuilder,
    this.footerBuilder,
    this.separatorBuilder,
    this.toggleButtonBuilder,
    this.showToggleButton = true,
    this.headerDivider,
    this.footerDivider,
    this.animationDuration = const Duration(milliseconds: 300),
    this.collapseIcon = Icons.arrow_back_ios_new,
    this.extendIcon = Icons.arrow_forward_ios,
  }) : super(key: key);

  /// Default theme of Sidebar
  final SidebarXTheme theme;

  /// Theme of extended sidebar
  /// Using [theme] if [extendedTheme] is null
  final SidebarXTheme? extendedTheme;

  final List<SidebarXItem> items;
  final List<SidebarXItem> footerItems;

  /// Controller to interact with Sidebar from code
  final SidebarXController controller;

  /// Builder for implement custom seporators between [itmes]
  final IndexedWidgetBuilder? separatorBuilder;

  /// Builder for implement your custom Sidebar header
  final SidebarXBuilder? headerBuilder;

  /// Builder for implement your custom Sidebar footer
  final SidebarXBuilder? footerBuilder;

  /// Builder for toggle button at the bottom of the bar
  final SidebarXBuilder? toggleButtonBuilder;

  /// Sidebar showing toggle button if value [true]
  /// not showing if value [false]
  final bool showToggleButton;

  /// Divider between header and [items]
  final Widget? headerDivider;

  /// Divider footer header and [items]
  final Widget? footerDivider;

  /// Togglin animation duration
  final Duration animationDuration;

  /// Collapse Icon
  final IconData collapseIcon;

  /// Extend Icon
  final IconData extendIcon;

  @override
  State<SidebarX> createState() => _SidebarXState();
}

class _SidebarXState extends State<SidebarX>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    if (widget.controller.extended) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
    widget.controller.extendStream.listen(
      (extended) {
        if (_animationController?.isCompleted ?? false) {
          _animationController?.reverse();
        } else {
          _animationController?.forward();
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
          duration: widget.animationDuration,
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
                      animationController: _animationController!,
                      extended: widget.controller.extended,
                      selected: widget.controller.selectedIndex == index,
                      onTap: () => _onItemSelected(item, index),
                      onLongPress: () => _onItemLongPressSelected(item, index),
                      onSecondaryTap: () =>
                          _onItemSecondaryTapSelected(item, index),
                    );
                  },
                ),
              ),
              widget.footerDivider ?? const SizedBox(),
              widget.footerBuilder?.call(context, widget.controller.extended) ??
                  const SizedBox(),
              if (widget.footerItems.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    reverse: true,
                    itemCount: widget.footerItems.length,
                    separatorBuilder: widget.separatorBuilder ??
                        (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final item = widget.footerItems.reversed.toList()[index];
                      return SidebarXCell(
                        item: item,
                        theme: t,
                        animationController: _animationController!,
                        extended: widget.controller.extended,
                        selected: widget.controller.selectedIndex ==
                            widget.items.length +
                                widget.footerItems.length -
                                index -
                                1,
                        onTap: () => _onFooterItemSelected(item, index),
                        onLongPress: () =>
                            _onFooterItemLongPressSelected(item, index),
                        onSecondaryTap: () =>
                            _onFooterItemSecondaryTapSelected(item, index),
                      );
                    },
                  ),
                ),
              if (widget.showToggleButton)
                _buildToggleButton(t, widget.collapseIcon, widget.extendIcon),
            ],
          ),
        );
      },
    );
  }

  void _onFooterItemSelected(SidebarXItem item, int index) {
    item.onTap?.call();
    if (item.selectable) {
      widget.controller.selectIndex(
          widget.items.length + widget.footerItems.length - index - 1);
    }
  }

  void _onFooterItemLongPressSelected(SidebarXItem item, int index) {
    item.onLongPress?.call();
  }

  void _onFooterItemSecondaryTapSelected(SidebarXItem item, int index) {
    item.onSecondaryTap?.call();
  }

  void _onItemSelected(SidebarXItem item, int index) {
    item.onTap?.call();
    if (item.selectable) {
      widget.controller.selectIndex(index);
    }
  }

  void _onItemLongPressSelected(SidebarXItem item, int index) {
    item.onLongPress?.call();
  }

  void _onItemSecondaryTapSelected(SidebarXItem item, int index) {
    item.onSecondaryTap?.call();
  }

  Widget _buildToggleButton(
    SidebarXTheme sidebarXTheme,
    IconData collapseIcon,
    IconData extendIcon,
  ) {
    final buildedToggleButton =
        widget.toggleButtonBuilder?.call(context, widget.controller.extended);
    if (buildedToggleButton != null) {
      return buildedToggleButton;
    }

    return InkWell(
      key: const Key('sidebarx_toggle_button'),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        if (_animationController!.isAnimating) return;
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
              widget.controller.extended ? collapseIcon : extendIcon,
              color: sidebarXTheme.iconTheme?.color,
              size: sidebarXTheme.iconTheme?.size,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController = null;
    super.dispose();
  }
}
