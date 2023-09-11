import 'package:flutter/material.dart';
import 'package:schoolpen/constents/AssetsPath.dart';

Widget banner(context, {String? title, String? desc, String? image}) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(AssetsPath.bannerBg),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1, // Adjust flex as needed to control image width
            child: Image.asset(
              "$image", // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0), // Add spacing between image and text
          Expanded(
            flex: 2, // Adjust flex as needed to control text width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                    height: 8.0), // Add spacing between title and description
                Text(
                  '$desc',
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
