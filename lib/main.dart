import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'screens/import_overview.dart';
import 'screens/outfit_customization.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => VirtualWardrobeApp(),
  ));
}

class VirtualWardrobeApp extends StatelessWidget {
  const VirtualWardrobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      title: 'Virtual Wardrobe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFD7CEC7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD7CEC7), // Change AppBar color here
          elevation: 0, // Optional: remove AppBar shadow if desired
          foregroundColor:
              Colors.black, // Text color for the AppBar title and icons
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/clothing-overview': (context) => ClothingOverviewPage(),
        '/outfit-customization': (context) => OutfitCustomizationPage(),
      },
    );
  }
}
