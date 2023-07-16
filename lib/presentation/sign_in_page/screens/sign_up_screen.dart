import 'package:flutter/material.dart';
import 'package:todo_nodejs/model/user.dart';
import 'package:todo_nodejs/presentation/core/colors/colors.dart';
import 'package:todo_nodejs/presentation/core/constant/constant.dart';
import 'package:todo_nodejs/presentation/home_page/homepage.dart';
import 'package:todo_nodejs/presentation/login_page/screens/login_screen.dart';
import 'package:todo_nodejs/presentation/sign_in_page/widgets/textfieldsignup.dart';
import 'package:todo_nodejs/services/api_service.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                sbox,
                sbox,
                TextFieldSignUp(
                    controller: nameController,
                    icon: Icons.edit,
                    title: 'Name'),
                // sbox,
                // TextFieldSignUp(
                //     icon: CustomIcon.callicon,
                //     title: 'Phone Number',
                //     isNumberPad: true),
                sbox,
                TextFieldSignUp(
                    selection: 1,
                    controller: emailController,
                    icon: Icons.sms,
                    title: 'Email'),
                sbox,
                TextFieldSignUp(
                  // validator: ,
                  passwordVisible: true,
                  controller: passwordController,
                  icon: Icons.password,
                  title: 'Password',
                ),
                sbox,
                sbox,
                // SignUpButton(size: size, color: colorgreen, text: 'SignUp',widget: MainPage()),
                InkWell(
                  onTap: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      UserService.registerUser(User(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text));
                 
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
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
                          'SignUp',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                sbox,

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
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
