import 'package:flutter/material.dart';
import 'package:schoolpen/Widgets/ProgressBar.dart';
import 'package:schoolpen/constents/AssetsPath.dart';
import 'package:schoolpen/constents/Colors.dart';

// Define a StatefulWidget called FaceIdPage
class FaceIdPage extends StatefulWidget {
  const FaceIdPage({super.key});

  @override
  State<FaceIdPage> createState() => _FaceIdPageState();
}

// Define the state for the FaceIdPage widget
class _FaceIdPageState extends State<FaceIdPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller with a duration
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // Create a tween animation for counting from 0 to 100
    _animation = IntTween(begin: 0, end: 100).animate(_controller);

    // Start the animation
    _controller.forward();

    // Add a listener to update the UI with the animated value
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              AssetsPath.person,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 80),
                child: Image.asset(
                  AssetsPath.fream,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  height: 280,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            // Display different text based on the animated value
                            _animation.value < 30
                                ? "LooK Front"
                                : _animation.value < 60
                                    ? "Look Right"
                                    : "Look Left",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Keep your face in the frame.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.34,
                              color: AppColors.lightBlack,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${_animation.value}%", // Display the animated value
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      ProgressBar(
                          value: _animation.value
                              .toDouble()) // Display a progress bar
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      // For Only Navigate To Next Page
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(19, 0, 0, 0),
        elevation: 0,
        onPressed: () {
          // Navigate to the '/fingerprint' route when the button is pressed
          Navigator.pushNamed(context, '/fingerprint');
        },
        child: const Center(
            child: Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Colors.white,
        )),
      ),
    );
  }
}
