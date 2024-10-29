import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LookLab'),
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
