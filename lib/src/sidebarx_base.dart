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
    this.toggleButtonLabel,
    this.headerDivider,
    this.footerDivider,
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
  final String? toggleButtonLabel;

  final Widget? headerDivider;
  final Widget? footerDivider;

  @override
  State<SidebarX> createState() => _SidebarXState();
}

class _SidebarXState extends State<SidebarX>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    widget.controller.extendStream.listen(
      (extended) {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
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
          duration: const Duration(milliseconds: 300),
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
              widget.footerDivider ?? BaseDivider(theme: t),
              widget.footerBuilder?.call(context, widget.controller.extended) ??
                  const SizedBox(),
              if (widget.showToggleButton) ...[
                _buildToggleButton(t),
              ]
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

    return SidebarXCell(
      item: SidebarXItem(
        icon: Icons.arrow_back_ios,
        label: widget.toggleButtonLabel,
      ),
      theme: sidebarXTheme,
      animationController: _animationController,
      extended: widget.controller.extended,
      selected: false,
      onTap: () {
        widget.controller.toggleExtended();
      },
    );
  }
}
