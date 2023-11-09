import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/weather_api.dart';
import 'package:weather_app/widget/Text_box_column.dart';
import 'package:weather_app/widget/city_selection_age%20.dart';
import 'package:weather_app/widget/down_box_column.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key, this.weather})
      : super(key: key); // Fixed super and key

  final Weather? weather;

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    int? calculatedGreenContainerWidth =
        (widget.weather?.current.humidity ?? 0) ~/ 2;
    int? calculatedGreenContainerWidthRain =
        (widget.weather?.current.cloud ?? 0) ~/ 2;
    int? calculatedGreenContainerWidthwindKph =
        (widget.weather?.current.windKph ?? 0) ~/ 2;
    String cityName = ''; // Store the selected city name here
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 193, 7),
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () async {
            final newCity = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CitySelectionPage()),
            );

            if (newCity != null && newCity.isNotEmpty) {
              setState(() {
                cityName = newCity; // Update the selected city name
              });
            }
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10), // Corrected EdgeInsets
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/menu.svg",
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/${widget.weather?.current.isDay == 0 ? "night.jpg" : "sunny.jpg"}', // Fixed asset path
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black38),
            ),
            Container(
              padding: const EdgeInsets.all(20), // Corrected EdgeInsets
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextColumn(
                        title: "${widget.weather?.location.name}",
                        subtitle: '${widget.weather?.location.localtime}',
                      ),
                      SizedBox(height: 200),
                      CustomTextColumn(
                        title: '${widget.weather?.current.tempC}\u2103',
                        subtitle:
                            '${widget.weather?.current.isDay == 0 ? "Night" : "Day"}',
                        titleStyle: const TextStyle(
                            fontSize: 85,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                        image: SvgPicture.asset(
                          '${widget.weather?.current.isDay == 0 ? "assets/moon.svg" : "assets/sun.svg"}',
                          height: 30,
                          width: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 40,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DownCustomTextColumn(
                        title: 'Wind',
                        subtitleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        subtitle: widget.weather?.current.windKph,
                        titleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        thedtitle: 'km/h',
                        thedtitleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        greenContainerWidth:
                            calculatedGreenContainerWidthwindKph.toDouble(),
                      ),
                      DownCustomTextColumn(
                        title: 'Rain',
                        subtitleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        subtitle: widget.weather?.current.cloud.toDouble(),
                        titleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        thedtitle: '%',
                        thedtitleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        greenContainerColor: Colors.red,
                        greenContainerWidth:
                            calculatedGreenContainerWidthRain.toDouble(),
                      ),
                      DownCustomTextColumn(
                        title: 'Humidity',
                        subtitleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        subtitle: widget.weather?.current.humidity.toDouble(),
                        titleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        thedtitle: '%',
                        thedtitleStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        greenContainerWidth:
                            calculatedGreenContainerWidth.toDouble(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
