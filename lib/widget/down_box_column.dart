import 'package:flutter/material.dart';

class DownCustomTextColumn extends StatelessWidget {
  final String title;
  final num? subtitle; // Accepts both int and double
  final String? thedtitle;
  final String? additionalText;
  final TextStyle titleStyle;
  final TextStyle thedtitleStyle;
  final TextStyle additionalTextStyle;
  final TextStyle subtitleStyle;
  final double? greenContainerWidth; // New parameter
  final Color? greenContainerColor; // New parameter

  DownCustomTextColumn({
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
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.additionalTextStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.subtitleStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.greenContainerWidth, // New parameter
    this.greenContainerColor, // New parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    subtitle != null ? subtitle.toString() : '0',
                    style: subtitleStyle,
                  ),
                ),
              ],
            ),
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
          Stack(
            children: [
              Container(
                height: 5,
                width: 50,
                color: Colors.white38,
              ),
              Container(
                height: 5,
                width: greenContainerWidth ??
                    15, // Use the provided width or a default value
                color: greenContainerColor ??
                    Colors.green, // Use the provided color or a default value
              )
            ],
          ),
        ],
      ),
    );
  }
}
