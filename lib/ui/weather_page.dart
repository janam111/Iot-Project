import 'package:flutter/material.dart';
import 'package:flutter_application_9/modelss/main_widget.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async {
  final zipCode = "182320";
  final apiKey = "bce5edb2b1fe25bc83184178d57a8f24";
  final requestUrl =
      "http://api.openweathermap.org/data/2.5/weather?zip=${zipCode},IN&units=metric&appid=${apiKey}";

  final response = await http.get(Uri.parse(requestUrl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading data");
  }
}

class WeatherInfo {
  final location;
  final temp;
  final tempMin;
  final tempMax;
  final weather;
  final humidity;
  final windSpeed;

  WeatherInfo({
    @required this.location,
    @required this.temp,
    @required this.tempMin,
    @required this.tempMax,
    @required this.weather,
    @required this.humidity,
    @required this.windSpeed,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        weather: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed']);
  }
}

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Future<WeatherInfo> futureWeather;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<WeatherInfo>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainWidget(
                  location: snapshot.data.location,
                  temp: snapshot.data.temp,
                  tempMin: snapshot.data.tempMin,
                  tempMax: snapshot.data.tempMax,
                  weather: snapshot.data.weather,
                  humidity: snapshot.data.humidity,
                  windSpeed: snapshot.data.windSpeed,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return CircularProgressIndicator();
            }));
  }
}
