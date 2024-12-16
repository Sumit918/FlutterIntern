import 'package:flutter/material.dart';

import 'package:my_first_app/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Screens(),
    );
  }
}
