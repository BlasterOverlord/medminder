import 'package:flutter/material.dart';
import 'package:medminder/pages/profile.dart';
import '../pages/home/home.dart';
import '../pages/history.dart';

class Navbar extends StatefulWidget {
  final String uid;
  const Navbar(this.uid, {super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // add your pages here brothers
  List<Widget> pages = [
    const History(),
    const Home(),
    ProfileSettingsPage(),
  ];

  int currentPageIndex = 1;
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.history), label: "History"),
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
