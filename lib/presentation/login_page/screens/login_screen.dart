import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_nodejs/model/user.dart';
import 'package:todo_nodejs/presentation/core/colors/colors.dart';
import 'package:todo_nodejs/presentation/core/constant/constant.dart';
import 'package:todo_nodejs/presentation/home_page/homepage.dart';
import 'package:todo_nodejs/presentation/sign_in_page/screens/sign_up_screen.dart';
import 'package:todo_nodejs/presentation/sign_in_page/widgets/textfieldsignup.dart';
import 'package:todo_nodejs/services/api_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  late SharedPreferences pref;

  @override
  void initState() {
    intisharedpref();
    super.initState();
  }

  intisharedpref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String? passwordValidator(String? password) {
      if (password!.isEmpty) {
        return 'Password empty';
      } else if (password.length < 8) {
        return 'password must be 8 digits';
      }
      return null;
    }

    String? emailaddressValidator(String? email) {
      if (!EmailValidator.validate(emailController.text.trim())) {
        return 'invalid email';
      }

      return null;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                const Center(
                  child: Text(
                    'Login to Account',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                sbox,
                sbox,
                sbox,
                sbox,
                // const SizedBox(
                //   height: 100,
                // ),
                TextFieldSignUp(
                    // passwordVisible: false,
                    validator: emailaddressValidator,
                    formKey: formKey,
                    selection: 1,
                    controller: emailController,
                    icon: Icons.email,
                    title: 'Email'),
                sbox,
                TextFieldSignUp(
                  passwordVisible: true,
                  // isNumberPad: true,
                  validator: passwordValidator,
                  // formKey: formKey,
                  controller: passwordController,
                  icon: Icons.password,
                  title: 'Password',
                ),
                sbox,
                sbox,
                // SignUpButton(
                //   // ontap: signIn(),
                //   size: size,
                //   color: colorgreen,
                //   text: 'Log In',
                //   widget: MainPage(),
                // ),
                InkWell(
                  onTap: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      var success = await UserService.loginUser(User(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                      if (success['status']) {
                        pref.setString('token', success['token']);
                        log('token stored in shared pref');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      }
                    }
                  },
                  child: Container(
                    width: size.width * 0.9,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorgreen),
                        borderRadius: BorderRadius.circular(20),
                        color: colorgreen),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                sbox,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: colorblack.withOpacity(0.5)),
                    ),
                    InkWell(
                      onTap: () {
                        // print(emailController.text.trim());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        "Sign In",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
