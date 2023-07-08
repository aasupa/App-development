import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:organo/pages/auth/sign_up_page.dart';
import 'package:organo/widgets/app_text_field.dart';
import 'package:organo/widgets/big_text.dart';

import '../../utlis/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),

            Container(
              child: Center(
                child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/image/logo.png")),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in to your account.",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),

            //email
            AppTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: 10,
            ),
            //password
            AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            SizedBox(
              height: 10,
            ),

            Container(
              width: 110,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign in",
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //signup options
            RichText(
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18,
                    ),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (context) => SignUpPage(),
                            )),
                      text: " Create",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 188, 66, 1),
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ))
                ])),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
