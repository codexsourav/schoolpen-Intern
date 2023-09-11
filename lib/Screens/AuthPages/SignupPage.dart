import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/customInputField.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  bool isSecureText = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // background image
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
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // top Text Box
                Positioned(
                  top: 100,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Column(
                        children: [
                          Text(
                            "Hello There!",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: Text(
                              "Let’s begin your journey with us ",
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
                // bottam form section
                Positioned(
                  bottom: 0,
                  child: _bottamForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Hire The Bottam Form App code
  Widget _bottamForm() {
    return SingleChildScrollView(
      child: Container(
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
              "Create your account",
              style: TextStyle(
                  color: AppColors.brand,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomInputField(
                          hint: "UserName",
                          validate: (val) {
                            // Define username validation regex
                            // ignore: no_leading_underscores_for_local_identifiers
                            final RegExp _usernameRegExp =
                                RegExp(r"^[a-zA-Z0-9_]+$");
                            if (!_usernameRegExp.hasMatch(val!)) {
                              return "Invalid UserName";
                            }
                            return null;
                          }),
                      const SizedBox(height: 30),
                      CustomInputField(
                        hint: "Mobile Number",
                        keyboardType: TextInputType.phone,
                        validate: (val) {
                          if (val!.length != 10) {
                            return "Enter A Valid Mobile Number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomInputField(
                        hint: "Email",
                        validate: (val) {
                          if (val!.isEmpty) {
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
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        title: "Signup",
                        onClick: () {
                          if (_form.currentState!.validate()) {
                            Navigator.pushNamed(context, '/otp');
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Login",
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
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
