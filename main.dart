import 'package:flutter/material.dart';
import 'package:flutter_application_5/MySignPage.dart';
import 'package:flutter_application_5/DataPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 114, 1, 134))),
      initialRoute: "/signpage",
      routes: {
        "/signpage": (context) => const MySignPage(),
        "/datapage": (context) => const DataPage()
      },
      home: const MySignPage(),
    );
  }
}
