import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                SidebarX(
                  controller: _controller,
                  theme: SidebarXTheme(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: canvasColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    selectedItemDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFF5F5FA7).withOpacity(0.37),
                      ),
                      gradient: const LinearGradient(
                        colors: [accentCanvasColor, canvasColor],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.28),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  headerBuilder: (context, extended) {
                    return SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/images/avatar.png'),
                      ),
                    );
                  },
                  extendedTheme: const SidebarXTheme(
                    width: 200,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  items: [
                    SidebarXItem(
                      icon: Icons.home,
                      label: 'Home',
                      onTap: () {
                        debugPrint('Hello');
                      },
                    ),
                    const SidebarXItem(
                      icon: Icons.search,
                      label: 'Search',
                    ),
                    const SidebarXItem(
                      icon: Icons.people,
                      label: 'People',
                    ),
                    const SidebarXItem(
                      icon: Icons.favorite,
                      label: 'Favorite',
                    ),
                  ],
                ),
                const _ScreensExample(),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: ElevatedButton(
            //       onPressed: () => _controller.toggleExtended(),
            //       child: const Text('Extend'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) => Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).canvasColor,
            boxShadow: const [BoxShadow()],
          ),
        ),
      ),
    );
  }
}
