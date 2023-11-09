import 'package:flutter/material.dart';

class CustomTextColumn extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? thedtitle;
  final String? additionalText;
  final TextStyle titleStyle;
  final TextStyle thedtitleStyle; // Style for thedtitle
  final TextStyle additionalTextStyle; // Style for additionalText
  final TextStyle subtitleStyle; // Style for subtitle
  final Widget? image;

  CustomTextColumn({
    required this.title,
    this.subtitle,
    this.thedtitle,
    this.additionalText,
    this.titleStyle = const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.thedtitleStyle = const TextStyle(
      fontSize: 22, // Customize as needed
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.additionalTextStyle = const TextStyle(
      fontSize: 22, // Customize as needed
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.image,
    this.subtitleStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Row(
            children: [
              if (image != null)
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: image,
                ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  subtitle ?? '', // Use an empty string if subtitle is null
                  style: subtitleStyle,
                ),
              ),
            ],
          ),
          if (thedtitle != null)
            Text(
              thedtitle!,
              style: thedtitleStyle,
            ),
          if (additionalText != null)
            Text(
              additionalText!,
              style: additionalTextStyle,
            ),
        ],
      ),
    );
  }
}
