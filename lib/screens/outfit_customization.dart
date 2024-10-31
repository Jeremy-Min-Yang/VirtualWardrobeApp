import 'package:flutter/material.dart';

class OutfitCustomizationPage extends StatefulWidget {
  const OutfitCustomizationPage({super.key});

  @override
  State<OutfitCustomizationPage> createState() =>
      _OutfitCustomizationPageState();
}

class _OutfitCustomizationPageState extends State<OutfitCustomizationPage> {
  final Color maroonColor = const Color(0xFF76323F); // Maroon color for all items
  int _selectedIndex = 3; // Default to the "Fits" tab on navigation bar
  bool includeJacket = false; // Checkbox state for Jacket

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
    'lib/assets/images/sample_pants2.jpg',
  ];
  final List<String> shoes = [
    'lib/assets/images/sample_shoes1.png',
    'lib/assets/images/sample_shoes2.png',
  ];

  int selectedHatIndex = 0;
  int selectedTopIndex = 0;
  int selectedBottomIndex = 0;
  int selectedShoeIndex = 0;

  // Function to cycle through items
  void cycleItem(List<String> items, int index, bool forward, Function(int) onUpdate) {
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

    // Navigate to Main Page if "Home" is tapped
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/clothing-overview');
    }
  }

  // Function to handle AI assistant interaction
  void showAIAdvice() {
    // Placeholder for AI interaction logic
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("AI Assistant"),
        content: const Text("Here's some advice on what to wear today!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClothingItemSelector(hats, selectedHatIndex, (index) => setState(() => selectedHatIndex = index)),
              _buildClothingItemSelector(tops, selectedTopIndex, (index) => setState(() => selectedTopIndex = index)),
              _buildClothingItemSelector(bottoms, selectedBottomIndex, (index) => setState(() => selectedBottomIndex = index)),
              _buildClothingItemSelector(shoes, selectedShoeIndex, (index) => setState(() => selectedShoeIndex = index)),
            ],
          ),
          Positioned(
            right: 30,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.casino, color: maroonColor, size: 32),
                  onPressed: randomizeOutfit,
                ),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline, color: maroonColor, size: 32),
                  onPressed: showAIAdvice,
                ),
              ],
            ),
          ),
          Positioned(
            left: 30,
            child: Row(
              children: [
                Checkbox(
                  value: includeJacket,
                  onChanged: (bool? value) {
                    setState(() {
                      includeJacket = value ?? false;
                    });
                  },
                  activeColor: maroonColor,
                ),
                const Text(
                  "Jacket",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
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

  // Widget to build each clothing item with navigation arrows
  Widget _buildClothingItemSelector(List<String> items, int selectedIndex, Function(int) onUpdate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_left, color: Colors.grey),
          onPressed: () => cycleItem(items, selectedIndex, false, onUpdate),
        ),
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
        IconButton(
          icon: const Icon(Icons.arrow_right, color: Colors.grey),
          onPressed: () => cycleItem(items, selectedIndex, true, onUpdate),
        ),
      ],
    );
  }
}
