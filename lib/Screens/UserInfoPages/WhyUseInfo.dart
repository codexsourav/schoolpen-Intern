import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/Banner.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/HeaderSec.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

// ignore: must_be_immutable
class WhyUseInfoPage extends StatelessWidget {
  String? selectType;
  WhyUseInfoPage({super.key, this.selectType});

  Map<String, Map<String, String>> bannerContent = {
    "Student": {
      "title": "Student",
      "desc":
          "Eager to learn and grow? Join as a student to access knowledge, engage with peers, and thrive. ",
      "image": AssetsPath.bannerImageStudent
    },
    "Teacher": {
      "title": "Teacher",
      "desc":
          "Inspire and educate the future generation. Opt for the teacher profile to share knowledge and mentor students.",
      "image": AssetsPath.bannerImageTecher
    },
    "Parent": {
      "title": "Parent",
      "desc":
          "Ready to empower your child's education journey? Choose the parent profile to support and monitor progress.",
      "image": AssetsPath.bannerImageParent
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      "How you gonna use this app?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.brand,
                      ),
                    ),
                  ),
                  banner(
                    context,
                    title: bannerContent[selectType]?['title'],
                    desc: bannerContent[selectType]?['desc'],
                    image: bannerContent[selectType]?['image'],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 60, bottom: 30),
                      child: CustomButton(
                          title: "Submit",
                          height: 60,
                          onClick: () {
                            Navigator.pushNamed(context, '/login');
                          })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
