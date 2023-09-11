// ignore: file_names
import 'package:flutter/material.dart';
import 'package:schoolpen/Helpers/ShowSnackHalper.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/HeaderSec.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

class WhyUsePage extends StatefulWidget {
  const WhyUsePage({super.key});

  @override
  State<WhyUsePage> createState() => _WhyUsePageState();
}

class _WhyUsePageState extends State<WhyUsePage> {
  List<String> whyCases = ["Student", "Teacher", "Parent"];
  String select = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.all(10.0),
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
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 20,
                    children: List.generate(
                      whyCases.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            select = whyCases[index];
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          height: 55,
                          decoration: BoxDecoration(
                              color: select == whyCases[index]
                                  ? AppColors.secendery
                                  : AppColors.inputBgColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                            whyCases[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: select == whyCases[index]
                                  ? Colors.white
                                  : AppColors.black,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 80, bottom: 30),
                      child: CustomButton(
                          title: "Submit",
                          height: 60,
                          onClick: () {
                            if (select.isEmpty) {
                              showMySnack(context,
                                  mesage: "Please Select A Option",
                                  color: Colors.red);
                            } else {
                              Navigator.of(context)
                                  .pushNamed('/whyuseinfo', arguments: select);
                            }
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
