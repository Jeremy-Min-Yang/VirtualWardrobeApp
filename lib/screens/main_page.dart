import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/looklablogo.svg', // Path to your SVG file
              height: 30, // Adjust size as needed
            ),
            const SizedBox(width: 10), // Spacing between the logo and text
            const Text('LookLab'),
          ],
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
