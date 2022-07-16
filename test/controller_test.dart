import 'package:flutter_test/flutter_test.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  group('SidebarXController', () {
    test('setExtended', () {
      final controller = SidebarXController(selectedIndex: 0);
      controller.setExtended(true);
      expect(controller.extended, true);
      controller.setExtended(false);
      expect(controller.extended, false);
    });

    test('toggleExtended', () {
      final controller = SidebarXController(selectedIndex: 0, extended: false);
      controller.toggleExtended();
      expect(controller.extended, true);
      controller.toggleExtended();
      expect(controller.extended, false);
    });

    test('selectIndex', () {
      final controller = SidebarXController(selectedIndex: 0);
      controller.selectIndex(1);
      expect(controller.selectedIndex, 1);
      controller.selectIndex(20);
      expect(controller.selectedIndex, 20);
    });

    test('extendStream', () {
      final controller = SidebarXController(selectedIndex: 0, extended: true);
      expectLater(controller.extendStream, emits(false));
      controller.toggleExtended();
    });
  });
}
