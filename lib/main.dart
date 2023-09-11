import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolpen/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar as transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: "School Pen",
      // Set Default Theme
      theme: ThemeData(
        fontFamily: "lato",
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromARGB(17, 255, 255, 255)),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "lato"),
      ),

      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoutes,
      initialRoute: "/splash",
    );
  }
}
