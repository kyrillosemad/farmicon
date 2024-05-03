import 'dart:io';

import 'package:farmicon/app/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyD7k2Nq1rX24bcyAT9W3MzqB6EU-vuSHoY",
            appId: "1:771230643858:android:26a3832addd78878c6d84b",
            messagingSenderId: "771230643858",
            projectId: "farmicon-72d57",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const Farmicon());
}
