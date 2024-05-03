import 'package:farmicon/presentation/constants/colors.dart';
import 'package:farmicon/presentation/screens/explore.dart';
import 'package:farmicon/presentation/screens/network.dart';
import 'package:farmicon/presentation/screens/scan_code.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curInd = 2;
  List<Widget> body = [
    const Explore(),
    const ScanCode(),
    const Network(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: curInd == 1
            ? colors().scan_page_color
            : colors().main_network_page_color,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: MoltenBottomNavigationBar(
            selectedIndex: curInd,
            onTabChange: (clickedIndex) {
              setState(() {
                curInd = clickedIndex;
              });
            },
            barHeight: 7.h,
            barColor: curInd == 1
                ? colors().scan_page_color
                : colors().main_network_page_color,
            domeCircleColor: colors().secondary_color,
            tabs: [
              MoltenTab(
                icon: Icon(
                  Icons.explore_outlined,
                  size: 25.sp,
                ),
                title: Text(
                  "Explore",
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
              ),
              MoltenTab(
                icon: Icon(
                  Icons.qr_code_scanner_outlined,
                  size: 25.sp,
                ),
                title: Text(
                  "Scan Code",
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
              ),
              MoltenTab(
                icon: Icon(
                  Icons.schema_rounded,
                  size: 25.sp,
                ),
                title: Text(
                  "Network",
                  style: TextStyle(color: Colors.white, fontSize: 10.sp),
                ),
              ),
            ],
          ),
        ),
        body: body[curInd],
      ),
    );
  }
}
