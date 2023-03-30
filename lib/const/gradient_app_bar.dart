import 'package:flutter/material.dart';

class styleAppBar extends StatelessWidget{
  const styleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration:  const BoxDecoration(
  gradient: LinearGradient(
  colors: [Colors.deepOrangeAccent, Colors.deepPurple],
  begin: Alignment.bottomRight,
  end: Alignment.bottomCenter,
  )));

  }
}