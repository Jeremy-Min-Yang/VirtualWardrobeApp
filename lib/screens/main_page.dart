import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/clothing-overview');
              },
              child: const Text('Add/View Clothing Item'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/outfit-customization');
              },
              child: const Text('Customize Outfit'),
            ),
          ],
        ),
      ),
    );
  }
}
