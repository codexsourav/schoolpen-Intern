import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/customInputField.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSecureText = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.brand,
        image: DecorationImage(
          image: AssetImage(
            AssetsPath.loginBg,
          ),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 200,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        "Hello Again!",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        child: Text(
                          "Welcome Back, We’ve been waiting for you.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _bottamForm(),
            ),
          ],
        ),
      ),
    );
  }

// Hire The Bottam Form App code
  Widget _bottamForm() {
    return Container(
      padding: const EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            "Login",
            style: TextStyle(
                color: AppColors.brand,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          Form(
              key: _form,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CustomInputField(
                    hint: "Email",
                    validate: (val) {
                      if (val!.length == 0) {
                        return "Please Enter A Email ID";
                      }
                      if (!EmailValidator.validate(val.toString())) {
                        return "Invalid Email ID!!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                      hint: "Password",
                      obscureText: isSecureText,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter A Password";
                        } else if (val.length < 5) {
                          return "Password Must Be Min 5";
                        }
                        return null;
                      },
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecureText = !isSecureText;
                            });
                          },
                          icon: Icon(
                            !isSecureText
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_rounded,
                          ),
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: AppColors.brand,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    title: "Login",
                    onClick: () {
                      if (_form.currentState!.validate()) {
                        Navigator.of(context).pushNamed('/LicensekeyPage');
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Don’t have an  account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(
                                color: AppColors.brand,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
