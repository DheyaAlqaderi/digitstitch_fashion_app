import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  final List<String> titles;
  final List<IconData> icons;
  final int bottomNavIndex;
  final ValueChanged<int> onTabChange; // Define the onTabChange callback

   const BottomNav({
    super.key,
    required this.titles,
    required this.icons,
    required this.bottomNavIndex,
    required this.onTabChange, // Add onTabChange to the constructor
  });

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.bottomNavIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.brown,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.brown,
            tabs: widget.titles.asMap().entries.map((entry) {
              final index = entry.key;
              final title = entry.value;
              final icon = widget.icons[index];
              return GButton(
                icon: icon,
                text: title,
              );
            }).toList(),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTabChange(index); // Call the onTabChange callback
            },
          ),
        ),
      ),
    );
  }
}
