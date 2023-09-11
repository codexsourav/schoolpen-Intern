import 'package:flutter/material.dart';
import 'package:schoolpen/Helpers/DialogHalper.dart';
import 'package:schoolpen/Widgets/CustomButton.dart';
import 'package:schoolpen/Widgets/customInputField.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

// Define a StatelessWidget called LicensekeyPage
class LicensekeyPage extends StatelessWidget {
  // Constructor for LicensekeyPage
  const LicensekeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        elevation: 0,
        actions: actionsBtns,
        // Display action buttons in the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('codexsourav404@gmail.com',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Show an alert dialog when the button is pressed
                showAlertDialog(context, dialog: customDialog(context));
              },
              child: const Text("Press"),
              // Display a button with the text "Press"
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
      // Display a drawer in the app
    );
  }
}

// List of action buttons for the app bar
List<Widget> actionsBtns = [
  headerIcons(icon: Icons.search),
  headerIcons(icon: Icons.chat_bubble),
  headerIcons(icon: Icons.notifications),
  Container(
    margin: const EdgeInsets.only(right: 15),
    child: CircleAvatar(
      backgroundImage: AssetImage(AssetsPath.person),
    ),
  )
];

// Create a widget for header icons
Widget headerIcons({IconData? icon}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(right: 15),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.brand,
        ),
      ),
    ),
  );
}

// Define a custom alert dialog
AlertDialog customDialog(context) => AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      elevation: 0,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        // Set the border radius for the dialog
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter License key",
                // Dialog title
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.brand,
                ),
              ),
              const SizedBox(height: 25),
              // Add spacing
              CustomInputField(
                hint: "Please enter key",
                // Input field hint
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(AssetsPath.check),
                  // Display an image icon
                ),
              ),
              const SizedBox(height: 20),
              // Add spacing

              Center(
                child: CustomButton(title: "Submit"),
                // Display a custom button
              ),
              const SizedBox(height: 16),
              // Add spacing

              Column(
                children: [
                  Text(
                    "Not getting the license key?",
                    // Text explanation
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        " Talk to our  support.",
                        // A text button
                        style: TextStyle(
                            color: AppColors.brand,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
