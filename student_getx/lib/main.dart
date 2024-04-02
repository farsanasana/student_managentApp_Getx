import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/controllers/initialization.dart';
import 'package:student_getx/screens/student%20list/student_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitializeControllers(),
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 46, 45, 45))),
      debugShowCheckedModeBanner: false,
      home: const StdntListView(),
    );
  }
}
