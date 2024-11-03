import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClothingOverviewPage extends StatefulWidget {
  const ClothingOverviewPage({super.key});

  @override
  State<ClothingOverviewPage> createState() => _ClothingOverviewPageState();
}

class _ClothingOverviewPageState extends State<ClothingOverviewPage> {
  final Color maroonColor =
      const Color(0xFF76323F); // Maroon color for all items
  final Color greyColor = const Color(0xFF565656); // New color for text
  int _selectedIndex = 2; // Default to the "Add" tab for the import page

  // Navigation bar item tap handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/'); // Navigate to Main Page
        break;
      case 1:
        print('Save Selected');
        break;
      case 2: // Camera Screen when clicking "Add"
        _showCameraScreen(context); // Show camera screen
        break;
      case 3:
        Navigator.pushNamed(
            context, '/outfit-customization'); // Go to Outfit Customization
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
              Navigator.pop(context); // Return to previous screen after tapping
            },
            child: Image.asset(
              'lib/assets/images/camerascreen.png',
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
      backgroundColor: Colors.white, // Set consistent background color
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background color to white
        elevation: 0, // No elevation shadow
        scrolledUnderElevation: 0, // Ensure no elevation change when scrolling
        automaticallyImplyLeading: false, // Remove the default back button
        centerTitle: true, // Center the title
        title: Text(
          'Import Overview',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: maroonColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    _showCameraScreen(
                        context); // Show camera screen when tapped
                  },
                  icon: Icon(
                    Icons.add,
                    color: maroonColor, // Set icon color to maroon
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('Save Selected');
                  },
                  icon: Icon(
                    Icons.save, // Save icon (floppy disk)
                    color: maroonColor, // Set icon color to maroon
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: maroonColor, // Maroon-colored border
                          width: 2, // Thickness of the border
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.05), // Subtle shadow
                            blurRadius: 6, // Small blur radius for shadow
                            offset:
                                const Offset(0, 3), // Position of the shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'lib/assets/images/sample_jacket1.jpg',
                          fit: BoxFit.contain, // Fit image within the container
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Text fields below the image with maroon border
                    _buildTextFormField('North Face', 'Brand'),
                    const SizedBox(height: 15),
                    _buildTextFormField('Jacket', 'Item'),
                    const SizedBox(height: 15),
                    _buildTextFormField('Grey', 'Color'),
                    const SizedBox(height: 15),
                    _buildTextFormField('Medium', 'Size'),
                    const SizedBox(height: 15),
                    _buildTextFormField('Polyester', 'Material'),
                    const SizedBox(height: 15),
                    _buildTextFormField('Winter', 'Season'),
                    // Added space below the last text field
                    const SizedBox(height: 50), // Add extra padding below
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
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
            label: 'Add',
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
        selectedItemColor: maroonColor,
        unselectedItemColor: maroonColor,
        showUnselectedLabels: true,
      ),
    );
  }

  // Helper function to build text fields with maroon borders
  Widget _buildTextFormField(String initialValue, String label) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: greyColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: maroonColor), // Maroon border color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: maroonColor, width: 2.0), // Focused state with maroon
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: maroonColor, width: 1.0), // Enabled state maroon
        ),
      ),
    );
  }
}
