import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2; // Default to the "Add" button in the middle

  // Function to handle navigation bar item tapping
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add specific actions based on the item selected
    switch (index) {
      case 0:
        // Navigate to Favorites
        print('Favorites Selected');
        break;
      case 1:
        // Navigate to Collections
        print('Collections Selected');
        break;
      case 2:
        // Navigate to Add
        Navigator.pushNamed(context, '/clothing-overview');
        break;
      case 3:
        // Navigate to Fits
        print('Fits Selected');
        Navigator.pushNamed(context, '/outfit-customization');
        break;
      case 4:
        // Navigate to Login
        print('Login Selected');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Ensures the Row takes up minimal space
            children: [
              SvgPicture.asset(
                'lib/assets/images/looklablogo.svg', // Correct path to your SVG file
                height: 50, // Adjust size as needed
              ),
              const SizedBox(width: 10), // Spacing between the logo and text
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Main Page'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // To ensure all items are visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
            ), // Star for Favorites
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.collections,
              color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey,
            ), // Collections icon
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: const Color(
                  0xFF76323F), // Always maroon color for the Add icon
            ), // Add icon in the middle
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checkroom,
              color: _selectedIndex == 3 ? Colors.blueAccent : Colors.grey,
            ), // Fits icon
            label: 'Fits',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 4 ? Colors.blueAccent : Colors.grey,
            ), // Login/Profile icon
            label: 'Jeremy',
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        selectedItemColor: _selectedIndex == 2
            ? const Color(
                0xFF76323F) // Custom maroon color for "Add" text if it's selected
            : Colors.blueAccent,
        unselectedItemColor: Colors.grey, // General unselected items color
        showUnselectedLabels: true, // Ensure all labels are visible
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedIconTheme: const IconThemeData(size: 24),
      ),
    );
  }
}
