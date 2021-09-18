import 'package:flutter/material.dart';
import 'package:flutter_application_9/modelss/addons.dart';

class MainWidget extends StatelessWidget {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;
  MainWidget({
    @required this.location,
    @required this.temp,
    @required this.tempMin,
    @required this.tempMax,
    @required this.weather,
    @required this.humidity,
    @required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff222222),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.85,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff090979),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SMVDU,${location.toString()}",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightGreen),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "${temp.toInt().toString()}°C",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    "High of ${tempMax.toInt().toString()}°C, Low of ${tempMin.toInt().toString()}°C",
                    style: TextStyle(
                      color: Color(0xff537909),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  WeatherTile(
                      icon: Icons.thermostat_outlined,
                      title: "Temperature",
                      subtitle: "${temp.toInt().toString()}"),
                  WeatherTile(
                      icon: Icons.filter_drama_outlined,
                      title: "Weather",
                      subtitle: "${weather.toString()}"),
                  WeatherTile(
                      icon: Icons.wb_sunny,
                      title: "Humidity",
                      subtitle: "${humidity.toString()}"),
                  WeatherTile(
                      icon: Icons.waves_outlined,
                      title: "Wind Speed",
                      subtitle: "${windSpeed.toString()} MPH"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
