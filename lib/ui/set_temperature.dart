import 'package:flutter/material.dart';
import 'package:flutter_application_9/modelss/devices.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_9/ui/heater.dart';
import 'package:flutter_application_9/ui/trend_screen.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class Temperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    DateTime now = new DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd , kk:mm').format(now);

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff222222),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.only(
                  top: 29,
                  left: 32,
                  right: 32,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Hello User',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      subtitle: Text('$formattedDate'),
                      trailing:
                          CircleAvatar(child: Image.asset('assets/user.png')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: _RadialProgress(
                            width: width * 0.34,
                            height: width * 0.34,
                            progress: 0.7,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _PowerProgress(
                              power: "Water Heater",
                              progress: 0.7,
                              progressColor: Colors.red,
                              leftamount: 27,
                              width: width * 0.33,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _PowerProgress(
                              power: "Light",
                              progress: 0.2,
                              progressColor: Colors.yellow,
                              leftamount: 11,
                              width: width * 0.33,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _PowerProgress(
                              power: "Fridge",
                              progress: 0.5,
                              progressColor: Colors.blue,
                              leftamount: 18,
                              width: width * 0.33,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.35,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.55,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                    ),
                    child: Text(
                      "Devices Paired",
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 36,
                          ),
                          for (int i = 0; i < Devices.length; i++)
                            _DeviceCard(device: Devices[i]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PowerUsage()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 17,
                          bottom: 17,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0XFF20008B),
                              const Color(0XFF2A2A72),
                            ],
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Trend Analysis",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Power Outrage and Cost',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.grey),
                                    child: IconButton(
                                        iconSize: 60,
                                        padding: const EdgeInsets.all(10),
                                        icon: Image.asset(
                                          "assets/18405.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.yellow,
                                        ),
                                        onPressed: null),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Color(0XFF5B4D9D),
                                    ),
                                    child: IconButton(
                                        iconSize: 60,
                                        padding: const EdgeInsets.all(10),
                                        icon: Image.asset(
                                          "assets/graph2.png",
                                          width: 60,
                                          height: 60,
                                          color: Colors.yellow,
                                        ),
                                        onPressed: null),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: const Color(0XFF5B4D9D),
                                    ),
                                    child: IconButton(
                                        iconSize: 60,
                                        padding: const EdgeInsets.all(10),
                                        icon: Image.asset(
                                          "assets/graph3.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.yellow,
                                        ),
                                        onPressed: null),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PowerProgress extends StatelessWidget {
  final String power;
  final int leftamount;
  final double progress, width;
  final Color progressColor;
  const _PowerProgress(
      {Key key,
      this.power,
      this.leftamount,
      this.progress,
      this.progressColor,
      this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          power.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.black12),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftamount}KwH "),
          ],
        )
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;
  const _RadialProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(
        progress: 0.75,
      ),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "56",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff200087),
                ),
              ),
              TextSpan(text: '\n'),
              TextSpan(
                text: 'Kwh',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff200087)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;
  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xff200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _DeviceCard extends StatelessWidget {
  final Device device;
  const _DeviceCard({Key key, @required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WaterHeaterScreen(
                appliance: device,
              ),
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    device.imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        device.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Text(
                        device.unitsConsumed,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(device.timetaken),
                          SizedBox(
                            height: 16.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
