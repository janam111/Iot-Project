import 'package:flutter/material.dart';
import 'package:flutter_application_9/ui/profile_page.dart';
import 'package:flutter_application_9/ui/set_temperature.dart';
import 'package:flutter_application_9/ui/weather_page.dart';

Color primaryColor = Colors.black;

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: null,
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(
                        Icons.brightness_4_rounded,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.device_thermostat,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                  labelColor: Colors.red,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.red, width: 4.0),
                    insets: EdgeInsets.only(bottom: 44),
                  ),
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Weather(),
                  Temperature(),
                  Profilepage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
