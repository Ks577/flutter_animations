import 'package:flutter/material.dart';

class StyleAppBar extends StatelessWidget {
  const StyleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrangeAccent, Colors.deepPurple],
          begin: Alignment.bottomRight,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
