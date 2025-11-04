import 'package:flutter/material.dart';
import 'home_page.dart';
import 'notification_page.dart';
import 'profile_page.dart';
import 'chef_page.dart';
import 'search_page.dart';

// ignore: camel_case_types
class nav extends StatefulWidget {
  const nav({super.key});

  @override
  State<nav> createState() => _HomePageState();
}

class _HomePageState extends State<nav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    ChefPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],

      // FAB (ikon chef)
// FAB (ikon chef)
floatingActionButton: FloatingActionButton(
  backgroundColor: const Color(0xFF073B3A),
  elevation: 6,
  onPressed: () {
    setState(() {
      _selectedIndex = 2;
    });
  },
  shape: const CircleBorder(),
  child: Padding(
    padding: const EdgeInsets.all(8),
    child: Image.asset(
      "assets/image/logo-1.png",
      fit: BoxFit.contain,
    ),
  ),
),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 8,
        color: const Color.fromARGB(255, 206, 206, 206), //wana bg navbottom
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 0),
            _buildNavItem(Icons.search, 1),
            const SizedBox(width: 50), // ruang untuk FAB
            _buildNavItem(Icons.notifications_none, 3),
            _buildNavItem(Icons.person_outline, 4),
          ],
        ),
      ),
    );
  }

  // Widget untuk ikon navigasi
  Widget _buildNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;

    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 26,
          color: isSelected ? const Color(0xFF6EB4A6) : Colors.grey,
        ),
      ),
    );
  }
}
