<h1 align="center">
  SidebarX 🔥
</h1>

<h2 align="center"> Flutter multiplatform navigation sidebar / side navigationbar / drawer widget
</h2>
<p align="center">Show some ❤️ and <a href="https://github.com/Frezyx/sidebarx">star the repo</a> to support the project!</p>

| Mobile | Desktop | Web |
| :------------: | :------------: | :------------: |
| ![Image](https://github.com/Frezyx/sidebarx/blob/main/example/repo/example_mobile_small.gif?raw=true) | ![Image](https://github.com/Frezyx/sidebarx/blob/main/example/repo/example.gif?raw=true) | ![Image](https://github.com/Frezyx/sidebarx/blob/main/example/repo/example_web.gif?raw=true) |

<p align="center">
  <a href="https://pub.dev/packages/sidebarx"><img src="https://img.shields.io/pub/v/sidebarx.svg" alt="Pub"></a>
  <a href="https://github.com/Frezyx/sidebarx"><img src="https://img.shields.io/github/stars/Frezyx/sidebarx.svg?style=flat&logo=github&label=stars" alt="Star on Github"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/Frezyx/sidebarx"><img src="https://hits.dwyl.com/Frezyx/sidebarx.svg?style=flat" alt="Repository views"></a>
</p>
<p align="center">
  <a href="https://pub.dev/packages/sidebarx/score"><img src="https://badges.bar/sidebarx/likes" alt="Pub likes"></a>
  <a href="https://pub.dev/packages/sidebarx/score"><img src="https://badges.bar/sidebarx/popularity" alt="Pub popularity"></a>
  <a href="https://pub.dev/packages/sidebarx/score"><img src="https://badges.bar/sidebarx/pub%20points" alt="Pub points"></a>
</p>

## Getting started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  sidebarx: ^0.14.0
```

### Add import package

```dart
import 'package:sidebarx/sidebarx.dart';
```

## Easy to use
The package is designed with maximum adaptation to large screens.<br>
Therefore, adding a widget to your screen will be very simple.
```dart
    Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          // Your app screen body
        ],
      ),
    )
```
## Use with small mobile screens
On small screens and mobile devices, you can use the ready-made Sidebar widget as your application's drawer for excellent UX. 
<br>Otherwise, leave the code unchanged and get the same experience

```dart
    Scaffold(
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
      ),
      body: const Center(child: Text('Your app body')),
    )
```

## Additional information
The project is under development and ready for your pull-requests and issues 👍<br>
Thank you for support ❤️

<br>
<div align="center" >
  <p>Thanks to all contributors of this package</p>
  <a href="https://github.com/Frezyx/sidebarx/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=Frezyx/sidebarx" />
  </a>
</div>
<br>

<br>
For help getting started with 😍 Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
