import 'package:example/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drag Example',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color(0xDD181818),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
