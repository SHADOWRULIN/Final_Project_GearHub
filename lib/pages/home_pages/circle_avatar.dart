import 'package:flutter/material.dart';

String colorName2 = '';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color? selectedColor; 

  void selectColor(Color color, String name) {
    setState(() {
      selectedColor = color;
      colorName2 = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildColorCircle(Colors.red, "Red"),
        buildColorCircle(Colors.green, "Green"),
        buildColorCircle(Colors.blue, "Blue"),
      ],
    );
  }

  Widget buildColorCircle(Color color, String colorName) {
    return GestureDetector(
      onTap: () {
        selectColor(color, colorName);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.black : Colors.transparent,
            width: 3,
          ),
        ),
      ),
    );
  }
}
