import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/HeaderSec.dart';
import 'package:schoolpen/Widgets/customInputField.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class MyNamePage extends StatelessWidget {
  MyNamePage({super.key});
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              const SizedBox(
                height: 450,
              ),
              HeaderSec(
                showImage: false,
                height: 350,
              ),
              Positioned(
                  top: 170,
                  right: (MediaQuery.of(context).size.width / 2) - 150,
                  child: Image.asset(AssetsPath.thinkingillustration)),
            ],
          ),
          const SizedBox(height: 50),
          Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        "How we should call you?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColors.brand,
                        ),
                      ),
                    ),
                    CustomInputField(
                      hint: "Enter your Name",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "Enter Your Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                        title: "Next",
                        height: 60,
                        onClick: () {
                          if (_form.currentState!.validate()) {
                            Navigator.pushNamed(context, '/myregion');
                          }
                        }),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
