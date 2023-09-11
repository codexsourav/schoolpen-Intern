import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:schoolpen/Helpers/ShowSnackHalper.dart';
import 'package:schoolpen/Widgets/CustomKeybord.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _otpController = TextEditingController(text: "");

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _submitOtp() {
    Navigator.pushNamed(context, '/schoolinfo');
  }

  void _onKeyPressed(String value) {
    if (value == 'backspace') {
      if (_otpController.text.isNotEmpty) {
        _otpController.text =
            _otpController.text.substring(0, _otpController.text.length - 1);
      }
    } else if (value == "submit") {
      if (_otpController.text.length != 4) {
        showMySnack(context, mesage: 'Invalid Otp', color: Colors.red);
      } else {
        _submitOtp();
      }
    } else if (_otpController.text.length < 4) {
      final newText = _otpController.text + value;
      _otpController.text = newText;
    }
    if (_otpController.text.isNotEmpty) {
      _otpController.selection = TextSelection.fromPosition(
        TextPosition(offset: _otpController.text.length),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              AssetsPath.loginBg,
              width: MediaQuery.of(context).size.width,
              height: 240,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: Container(
                    margin: EdgeInsets.only(top: 85),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Why Verification?",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Text(
                            "It ensures security and access to your account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Positioned(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: MediaQuery.of(context).size.height - 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(23, 226, 226, 226)
                            .withOpacity(0.3), // Shadow color and opacity
                        spreadRadius: 2, // How far the shadow spreads
                        blurRadius: 5, // How blurry the shadow is
                        offset:
                            const Offset(0, -2), // Offset of the shadow (x, y)
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Verify your email",
                              style: TextStyle(
                                  color: AppColors.brand,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 24),
                            child: Text(
                              "We have sent you a code by email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightBlack),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: PinCodeTextField(
                          controller: _otpController,
                          keyboardType: TextInputType.none,
                          hideCharacter: true,
                          highlight: true,
                          highlightColor: Colors.transparent,
                          defaultBorderColor: Colors.transparent,
                          pinBoxColor: AppColors.inputBgColor.withOpacity(0.3),
                          maxLength: 4,
                          pinBoxRadius: 50,
                          pinBoxHeight: 53,
                          pinBoxOuterPadding:
                              EdgeInsets.symmetric(horizontal: 15),
                          wrapAlignment: WrapAlignment.center,
                          pinBoxWidth: 53,
                          onDone: (text) {
                            _submitOtp();
                          },
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: Text(
                                "Didn’t you receive any code?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightBlack),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(0))),
                              child: Text(
                                "Resend code",
                                style: TextStyle(
                                    color: AppColors.brand,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),

                      CustomKeyboard(
                          onKeyPressed:
                              _onKeyPressed), // Use the custom keyboard
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
