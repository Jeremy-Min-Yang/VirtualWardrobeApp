import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Default to "Home"
  final Color maroonColor =
      const Color(0xFF76323F); // Maroon color for all items

  // List of image paths for the cards
  final List<String> images = [
    'lib/assets/images/sample_jacket1.jpg',
    'lib/assets/images/sample_jacket2.jpg',
    'lib/assets/images/sample_pants1.jpg',
    'lib/assets/images/sample_shoes1.png',
    'lib/assets/images/sample_shoes2.png',
    'lib/assets/images/sample_hat1.png',
    'lib/assets/images/sample_shirt1.png',
  ];

  // Example selected outfit (can be dynamic in the real app)
  final Map<String, String> selectedOutfit = {
    'hat': 'lib/assets/images/sample_hat1.png',
    'top': 'lib/assets/images/sample_jacket1.jpg',
    'bottom': 'lib/assets/images/sample_pants1.jpg',
    'shoes': 'lib/assets/images/sample_shoes1.png',
  };

  // Function to handle navigation bar item tapping
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/'); // Navigate to Home
        break;
      case 1:
        print('Collections Selected');
        break;
      case 2: // "Add" button clicked
        _showCameraScreen(context); // Show camera screen first
        break;
      case 3:
        Navigator.pushNamed(context, '/outfit-customization',
            arguments: selectedOutfit); // Pass data to outfit customization
        break;
      case 4:
        print('Profile Selected');
        break;
    }
  }

  // Function to show the camera screen (camerascreen.png)
  void _showCameraScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/clothing-overview',
                  arguments:
                      selectedOutfit); // Pass outfit data to clothing overview
            },
            child: Image.asset(
              'lib/assets/images/camerascreen.png', // Show the camera screen image
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background color to white
        elevation: 0, // Remove AppBar shadow for a cleaner look
        scrolledUnderElevation: 0, // Prevent color change when scrolling
        automaticallyImplyLeading: false, // Ensure no back icon is shown
        title: Center(
          child: SvgPicture.asset(
            'lib/assets/images/looklablogo.svg', // Correct path to your SVG file
            height: 50, // Adjust size as needed
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Spacing from the AppBar

            // Row with Subtitle and Weather Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What shall we wear today?",
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay', // Custom font family
                      fontSize: 18, // Original font size
                      fontWeight: FontWeight.bold, // Standard bold for emphasis
                      color:
                          maroonColor, // Match subtitle text color to nav bar
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white, // Set background color to white
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.orange,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                ],
              ),
            ),

            const SizedBox(height: 20), // Spacing after weather widget

            // Grid of Cards with Images and Shadows
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                shrinkWrap: true, // Make GridView occupy only necessary space
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: images.map((imagePath) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), // Soft shadow color
                          blurRadius: 10, // Amount of blur for the shadow
                          offset: const Offset(0, 5), // Position of the shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit
                            .contain, // Center and scale images within the container
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.white, // Set BottomNavigationBar background to white
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: maroonColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections, color: maroonColor),
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: maroonColor),
            label: 'Add', // Clicking this will show the camera screen first
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom_outlined, color: maroonColor),
            label: 'Fits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: maroonColor),
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
