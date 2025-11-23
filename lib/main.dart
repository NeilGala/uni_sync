import 'package:flutter/material.dart';
import 'package:uni_sync/screens/auth_page/login_screen.dart';
import 'lib/screens/auth_page/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
