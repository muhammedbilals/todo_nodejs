import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_nodejs/presentation/home_page/homepage.dart';
import 'package:todo_nodejs/presentation/login_page/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  checkUserLoggedin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('token')!.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (checkUserLoggedin()==true) {
                return LoginPage();
              } else {
                return const HomePage();
              }
            },
          ),
        );
      },
    );
    return const Scaffold(
      body: Center(child: Text('Todo App')),
    );
  }
}
