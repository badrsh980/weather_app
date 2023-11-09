import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_api.dart';
import 'package:weather_app/screens/weather_app.dart';

void main() async {
  final apiKey = "702a97fdad194c94a3b223305230811";
  final weatherApi = WeatherApi(apiKey: apiKey);
  Weather? weather;

  try {
    weather = await weatherApi.getWeather("Riyadh");
    print("Location: ${weather.location.name}");
  } catch (e) {
    print("Error: $e");
  }

  GoogleFonts.config.allowRuntimeFetching = true;
  runApp(MyApp(weather: weather));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.weather}) : super(key: key);

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherApp(weather: weather),
    );
  }
}
