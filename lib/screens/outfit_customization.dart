import 'package:flutter/material.dart';

class OutfitCustomizationPage extends StatefulWidget {
  const OutfitCustomizationPage({super.key});

  @override
  State<OutfitCustomizationPage> createState() =>
      _OutfitCustomizationPageState();
}

class _OutfitCustomizationPageState extends State<OutfitCustomizationPage> {
  final Color maroonColor =
      const Color(0xFF76323F); // Maroon color for all items
  int _selectedIndex = 3; // Default to the "Fits" tab on navigation bar
  final TextEditingController _textController = TextEditingController();

  // Example clothing item lists
  final List<String> hats = [
    'lib/assets/images/sample_hat1.png',
    'lib/assets/images/sample_hat2.png',
  ];
  final List<String> tops = [
    'lib/assets/images/sample_jacket1.jpg',
    'lib/assets/images/sample_jacket2.jpg',
  ];
  final List<String> bottoms = [
    'lib/assets/images/sample_pants1.jpg',
    'lib/assets/images/sample_pants2.png',
  ];
  final List<String> shoes = [
    'lib/assets/images/sample_shoes1.png',
    'lib/assets/images/sample_shoes2.png',
  ];

  int selectedHatIndex = 0;
  int selectedTopIndex = 0;
  int selectedBottomIndex = 0;
  int selectedShoeIndex = 0;

  // Track which item is being hovered over
  int? hoveredItemIndex;

  // Function to cycle through items
  void cycleItem(
      List<String> items, int index, bool forward, Function(int) onUpdate) {
    setState(() {
      int newIndex = (index + (forward ? 1 : -1)) % items.length;
      if (newIndex < 0) newIndex = items.length - 1;
      onUpdate(newIndex);
    });
  }

  // Function to randomize outfit
  void randomizeOutfit() {
    setState(() {
      selectedHatIndex = (selectedHatIndex + 1) % hats.length;
      selectedTopIndex = (selectedTopIndex + 1) % tops.length;
      selectedBottomIndex = (selectedBottomIndex + 1) % bottoms.length;
      selectedShoeIndex = (selectedShoeIndex + 1) % shoes.length;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      // Show camera screen first, then navigate to import overview
      _showCameraScreen(context);
    } else {
      // Navigate to other pages as usual
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/'); // Navigate to Main Page
          break;
        case 3:
          Navigator.pushNamed(context, '/outfit-customization');
          break;
        default:
          break;
      }
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
              Navigator.pushReplacementNamed(context,
                  '/clothing-overview'); // Go to import_overview after tap
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

  // Function to handle AI assistant interaction with input field
  void showAIAdvice() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "LookLab Assistant",
          style: TextStyle(color: maroonColor, fontWeight: FontWeight.bold),
        ),
        content: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Ask LookLab AI...',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.mic, color: maroonColor),
              onPressed: () {
                // Placeholder for microphone functionality
                print("Microphone pressed");
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print("User input: ${_textController.text}");
              _textController.clear(); // Clear the input field after submission
            },
            child: Text(
              "Submit",
              style: TextStyle(color: maroonColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: maroonColor, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Outfit Customization',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            color: maroonColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Padding around the image selector column
          Padding(
            padding:
                const EdgeInsets.only(left: 40), // Add padding on the left side
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildClothingItemSelector(hats, selectedHatIndex, (index) {
                  setState(() => selectedHatIndex = index);
                }, 0),
                _buildClothingItemSelector(tops, selectedTopIndex, (index) {
                  setState(() => selectedTopIndex = index);
                }, 1),
                _buildClothingItemSelector(bottoms, selectedBottomIndex,
                    (index) {
                  setState(() => selectedBottomIndex = index);
                }, 2),
                _buildClothingItemSelector(shoes, selectedShoeIndex, (index) {
                  setState(() => selectedShoeIndex = index);
                }, 3),
              ],
            ),
          ),
          // Position elements on the right side with reduced gap
          Positioned(
            right:
                50, // Reduced right padding to bring icons closer to image cards
            top: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [
                // Save Icon
                IconButton(
                  icon: Icon(Icons.save, color: maroonColor, size: 32),
                  onPressed: () {
                    print("Save icon pressed");
                  },
                ),
                const SizedBox(height: 15), // Reduced padding between items

                // Randomize button
                IconButton(
                  icon: Icon(Icons.casino, color: maroonColor, size: 32),
                  onPressed: randomizeOutfit,
                ),
                const SizedBox(height: 15), // Reduced padding between items

                // AI advice button with label
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chat_bubble_outline,
                          color: maroonColor, size: 32),
                      onPressed: showAIAdvice,
                    ),
                    const SizedBox(
                        height: 4), // Reduced space between icon and text
                    const Text(
                      "Lab AI",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold, // Make text bold
                        color: Color(0xFF76323F), // Same maroon color as icons
                      ),
                    ),
                  ],
                ),
              ],
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

  // Widget to build each clothing item with navigation arrows and lock on hover
  Widget _buildClothingItemSelector(List<String> items, int selectedIndex,
      Function(int) onUpdate, int itemIndex) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredItemIndex = itemIndex; // Set the hovered item index
        });
      },
      onExit: (_) {
        setState(() {
          hoveredItemIndex = null; // Reset when no longer hovered
        });
      },
      child: Stack(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align items to the start (left)
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left, color: Colors.grey),
                onPressed: () =>
                    cycleItem(items, selectedIndex, false, onUpdate),
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: maroonColor.withOpacity(0.2)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        items[selectedIndex],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (hoveredItemIndex == itemIndex)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          print("Lock icon clicked for item $itemIndex");
                        },
                        child: Icon(Icons.lock_outline,
                            color: maroonColor, size: 24),
                      ),
                    ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right, color: Colors.grey),
                onPressed: () =>
                    cycleItem(items, selectedIndex, true, onUpdate),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
