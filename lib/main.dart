import 'package:flutter/material.dart';
import 'package:todo_nodejs/presentation/login_page/screens/login_screen.dart';
import 'package:todo_nodejs/presentation/screens/splash_screen.dart';
import 'package:todo_nodejs/presentation/sign_in_page/screens/sign_up_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
