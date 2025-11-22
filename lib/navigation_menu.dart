// File: lib/navigation_menu.dart
import 'package:flutter/material.dart';
import 'package:uni_sync/screens/bottom_nav_bar_page/calendar_page.dart';
import 'package:uni_sync/screens/bottom_nav_bar_page/faculty_page.dart';
import 'package:uni_sync/screens/bottom_nav_bar_page/hackathon_page.dart';
import 'package:uni_sync/screens/bottom_nav_bar_page/attendace_page.dart';
import 'package:uni_sync/screens/bottom_nav_bar_page/profile_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key, this.initialIndex = 2});

  final int initialIndex;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late int _selectedIndex;

  late final List<Widget> _pages = const [
    HackathonPage(),
    CalendarPage(),
    AttendacePage(),
    FacultyPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Hackathon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Faculty'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
