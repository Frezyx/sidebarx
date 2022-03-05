import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Row(
              children: [
                SidebarX(
                  controller: _controller,
                  theme: SidebarXTheme(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                  ),
                  headerBuilder: (context, extended) {
                    return Container(
                      height: 100,
                    );
                  },
                  extendedTheme: const SidebarXTheme(
                    width: 240,
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
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      width: double.infinity,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: const [BoxShadow()],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () => _controller.toggleExtended(),
                  child: Text('Extend'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
