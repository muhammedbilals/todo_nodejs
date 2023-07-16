
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:todo_nodejs/widgets/AppBarWidget.dart';
import 'package:todo_nodejs/presentation/core/colors/colors.dart';
import 'package:todo_nodejs/presentation/core/constant/constant.dart';
import 'package:todo_nodejs/presentation/sign_in_page/widgets/textfieldsignup.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    String? emailaddressValidator(String? email) {
      if (!EmailValidator.validate(emailController.text.trim())) {
        return 'invalid email';
      }

      return null;
    }

   

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Forgot Password'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  const Center(
                    child: Text(
                      'Recive an Email to reset your password',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  sbox,
                  sbox,
                  const SizedBox(
                    height: 100,
                  ),
                  TextFieldSignUp(
                      validator: emailaddressValidator,
                      formKey: formKey,
                      selection: 1,
                      controller: emailController,
                      icon: Icons.sms,
                      title: 'Email'),
                  sbox,
                  // SignUpButton(
                  //     // ontap: signIn(),
                  //     size: size,
                  //     color: colorgreen,
                  //     text: 'Log In',
                  //     widget: MainPage(),
                  //   ),
                  sbox,
                  sbox,
                  InkWell(
                    onTap: () {
                   
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
                            'Reset Password',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  sbox,

                  sbox,

                  sbox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
