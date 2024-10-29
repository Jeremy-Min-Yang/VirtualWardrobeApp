import 'package:flutter/material.dart';

class ClothingOverviewPage extends StatelessWidget {
  const ClothingOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothing Overview'),
      ),
      body: const Center(
        child:
            Text('This is the page to add or view details of a clothing item.'),
      ),
    );
  }
}
