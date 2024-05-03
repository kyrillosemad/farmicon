import 'package:farmicon/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';    
import 'package:sizer/sizer.dart';

class Farmicon extends StatelessWidget {
  const Farmicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GetMaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
