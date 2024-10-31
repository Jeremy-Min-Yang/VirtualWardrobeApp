import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2; // Default to the "Add" button in the middle
  final Color maroonColor =
      const Color(0xFF76323F); // Maroon color for all items
  final Color lightBeigeColor =
      const Color(0xFFF2EAE3); // Light shade for the navbar
  final Color tanColor =
      const Color(0xFFD7CEC7); // Tan color for the widget background

  // List of image paths for the cards
  final List<String> images = [
    '/assets/images/sample_jacket1.jpg',
    'assets/images/sample_jacket2.jpg',
    'assets/images/sample_pants1.jpg',
    'assets/images/sample_shoes1.png',
    'assets/images/sample_shoes2.png',
    'assets/images/sample_hat1.png',
    'assets/images/sample_shirt1.png',
  ];

  // Function to handle navigation bar item tapping
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add specific actions based on the item selected
    switch (index) {
      case 0:
        print('Favorites Selected');
        break;
      case 1:
        print('Collections Selected');
        break;
      case 2:
        Navigator.pushNamed(context, '/clothing-overview');
        break;
      case 3:
        print('Fits Selected');
        Navigator.pushNamed(context, '/outfit-customization');
        break;
      case 4:
        print('Login Selected');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tanColor, // Set AppBar background color to tan
        title: Center(
          child: SvgPicture.asset(
            'lib/assets/images/looklablogo.svg', // Correct path to your SVG file
            height: 50, // Adjust size as needed
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Spacing from the AppBar
            const Text(
              "What shall we wear today, Jeremy?",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay', // Custom font family
                fontSize: 18,
                fontWeight: FontWeight.bold, // Bolded for emphasis
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20), // Spacing after subtitle

            // Right-Aligned Weather Widget with Side Margins and No Shadow
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20), // Add horizontal padding
              child: Align(
                alignment:
                    Alignment.centerRight, // Aligns the container to the right
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: tanColor, // Set background color to tan
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.orange,
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Seoul',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '22°C',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Spacing after weather widget

            // Grid of Cards with Images
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            lightBeigeColor, // Light beige for the navbar background
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: maroonColor,
            ), // Star for Favorites
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.collections,
              color: maroonColor,
            ), // Collections icon
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: maroonColor, // Bold Add icon
            ), // Bold Add icon in the middle
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checkroom,
              color: maroonColor,
            ), // Fits icon
            label: 'Fits',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: maroonColor,
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
        selectedItemColor: maroonColor, // Maroon for all selected items
        unselectedItemColor: maroonColor, // Maroon for all unselected items
        showUnselectedLabels: true, // Ensure all labels are visible
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedIconTheme: const IconThemeData(size: 24),
      ),
    );
  }
}
