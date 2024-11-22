import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            // Method 1: Using a direct for loop
            Column(
              children: [
                for (String color in colors) Label(color),
              ],
            ),
            const SizedBox(height: 20), // Add spacing between sections
            const Label("Method 2: Map", bold: true),
            // Method 2: Using the map() method
            Column(
              children: colors.map((color) => Label(color)).toList(),
            ),
            const SizedBox(height: 20), // Add spacing between sections
            const Label("Method 3: Dedicated Function", bold: true),
            // Method 3: Using a dedicated function
            Column(
              children: buildColorLabels(colors),
            ),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

// Dedicated function to return a list of widgets
List<Widget> buildColorLabels(List<String> colors) {
  return colors.map((color) => Label(color)).toList();
}
