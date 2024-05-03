import 'package:farmicon/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors().main_network_page_color,
      body: Center(
        child: Text(
          "Explore",
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ),
    );
  }
}
