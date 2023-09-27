import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:organo/pages/auth/sign_in_page.dart';
import 'package:organo/widgets/app_text_field.dart';
import 'package:organo/widgets/big_text.dart';

import '../../utlis/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // if(name.isEmpty){

      // }else if(phone.isEmpty){

      // }else if(email.isEmpty){

      //  }else if(GetUtils.isEmail(email)){

      // }else if(password.isEmpty){

      // }else if(password.length<6){
//
      //  }else{

      // }
    }

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
            //name
            AppTextField(
                textController: nameController,
                hintText: "Name",
                icon: Icons.person),
            SizedBox(
              height: 10,
            ),
            //phone
            AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.phone),
            SizedBox(
              height: 5,
            ),
            //signup button
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign Up",
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage())),
              text: "Have an account already?",
              style: TextStyle(
                color: const Color.fromARGB(255, 126, 124, 124),
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            )),

            SizedBox(
              height: 15,
            ),
            //signup options
            RichText(
                text: TextSpan(
              text: "Sign up using one of the following methods?",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              ),
            )),
            SizedBox(
              height: 5,
            ),

            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/image/" + signUpImages[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
