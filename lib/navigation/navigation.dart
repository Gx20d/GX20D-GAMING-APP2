import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/games.dart';
import '../screens/apps.dart';
import '../screens/videos.dart';
import '../screens/profile.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    GamesScreen(),
    AppsScreen(),
    VideosScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_esports),
            label: "Games",
          ),
          NavigationDestination(
            icon: Icon(Icons.apps),
            label: "Apps",
          ),
          NavigationDestination(
            icon: Icon(Icons.video_library),
            label: "Videos",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}




