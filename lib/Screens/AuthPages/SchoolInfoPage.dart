import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/customInputField.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class SchoolInfoPage extends StatefulWidget {
  const SchoolInfoPage({super.key});

  @override
  State<SchoolInfoPage> createState() => SchoolInfoPageState();
}

class SchoolInfoPageState extends State<SchoolInfoPage> {
  bool isSecureText = true;
  final TextEditingController _filename = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  pickMyFile() async {
    FilePickerResult? pickfile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (pickfile != null) {
      _filename.text = pickfile.files.first.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    // background image
    return Scaffold(
      backgroundColor: AppColors.brand,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.brand,
                image: DecorationImage(
                  image: AssetImage(
                    AssetsPath.loginBg,
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
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
                              "Almost Done!",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
                              child: Text(
                                "Only the last step of the process remains.",
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
          ],
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
              "Enter your school info",
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
                          hint: "School Name",
                          validate: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your School Name";
                            }
                            return null;
                          }),
                      const SizedBox(height: 30),
                      CustomInputField(
                        hint: "Address",
                        keyboardType: TextInputType.text,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomInputField(
                        hint: "DIOS code",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(AssetsPath.check),
                        ),
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter DIOS code";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: pickMyFile,
                        child: CustomInputField(
                          hint: "Upload document",
                          controller: _filename,
                          enabled: false,
                          keyboardType: TextInputType.none,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(AssetsPath.file),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        title: "Signup",
                        onClick: () {
                          if (_form.currentState!.validate()) {
                            Navigator.pushNamed(context, '/LicensekeyPage');
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
                                Navigator.pushNamed(context, '/login');
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
