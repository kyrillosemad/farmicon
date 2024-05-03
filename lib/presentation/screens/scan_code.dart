// ignore_for_file: non_constant_identifier_names

import 'package:farmicon/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' hide Barcode;
import 'package:sizer/sizer.dart';
import 'package:barcode_widget/barcode_widget.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({super.key});

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  final GlobalKey globalKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = "";
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event.code!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    if (result != "") {
      Get.defaultDialog(content: Text(result));
    }
  }

  String name = "Nikhil Panwar";

  bool event_mode = false;
  bool share_info = false;
  TextEditingController event = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colors().scan_page_color,
        body: SingleChildScrollView(
          child: Container(
            color: colors().scan_page_color,
            width: 100.w,
            height: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.h),
                Container(
                  decoration: BoxDecoration(
                      color: colors().secondary_color,
                      boxShadow: [
                        BoxShadow(
                            color: colors().secondary_color,
                            spreadRadius: 2.5,
                            blurRadius: 1.5),
                      ],
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                      radius: 30.sp,
                      backgroundImage: const AssetImage(
                          "assets/images/14f69c1f55174fa23f19c133c76c58a4.png")),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Scan Here",
                      content:
                          BarcodeWidget(data: name, barcode: Barcode.qrCode()),
                    );
                  },
                  child: Text(
                    "Show My Qr Code",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: 85.w,
                  height: 35.h,
                  color: Colors.white,
                  child: QRView(key: globalKey, onQRViewCreated: qr),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(title: "Data", content: Text(result));
                  },
                  child: Text(
                    "read data",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Event Mode",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                    Switch(
                        activeColor: colors().secondary_color,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.black,
                        value: event_mode,
                        onChanged: (value) {
                          setState(() {
                            event_mode = value;
                          });
                        })
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                    width: 72.w,
                    height: 5.h,
                    child: Form(
                        child: TextFormField(
                      controller: event,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                          hintText: "Enter Your Event Name",
                          hintStyle: TextStyle(
                              fontSize: 10.sp, color: const Color(0xFF444444)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colors().secondary_color),
                              borderRadius: BorderRadius.circular(20.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colors().secondary_color),
                              borderRadius: BorderRadius.circular(20.sp))),
                    ))),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Share Your Info",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                    Switch(
                        activeColor: colors().secondary_color,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.black,
                        value: share_info,
                        onChanged: (value) {
                          setState(() {
                            share_info = value;
                          });
                        }),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          ),
        ));
  }
}
