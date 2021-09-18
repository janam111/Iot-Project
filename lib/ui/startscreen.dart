import 'package:flutter/material.dart';
import 'package:flutter_application_9/paths/routes.dart';

class OpeningView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      "assets/logomain.png",
      fit: BoxFit.contain,
    );

    final startupButton = Material(
        elevation: 15.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.orangeAccent,
        child: MaterialButton(
            minWidth: mq.size.width / 1.2,
            padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
            child: Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.routeauth);
            }));

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 15, 150),
          child: startupButton,
        ),
      ],
    );

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/Capture11234.PNG'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: logo,
                  ),
                  buttons,
                ],
              ),
            )));
  }
}
