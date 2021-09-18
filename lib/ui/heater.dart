import 'package:flutter/material.dart';
import 'package:flutter_application_9/modelss/devices.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WaterHeaterScreen extends StatefulWidget {
  final Device appliance;

  const WaterHeaterScreen({Key key, this.appliance}) : super(key: key);

  @override
  _WaterHeaterScreenState createState() => _WaterHeaterScreenState();
}

class _WaterHeaterScreenState extends State<WaterHeaterScreen> {
  void handlePointerValueChanged(double value) {
    setState(() {
      final int _value = value.toInt();
      _annotationValue = '$_value';
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff323232),
      body: Stack(children: <Widget>[
        Positioned(
          top: 150,
          height: height * 0.35,
          left: 15,
          right: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.only(
                top: 29,
                left: 32,
                right: 32,
                bottom: 10,
              ),
              child: Stack(children: <Widget>[
                SfRadialGauge(
                  title: GaugeTitle(
                      text: 'Set Temperature',
                      backgroundColor: Colors.red,
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(
                      axisLineStyle: AxisLineStyle(
                          thickness: 15,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Colors.yellow),
                      minimum: 0,
                      maximum: 50,
                      interval: 5,
                      pointers: <GaugePointer>[
                        MarkerPointer(
                          value: 0,
                          enableDragging: true,
                          color: Color(0xff000000),
                          markerWidth: 20,
                          markerHeight: 20,
                          markerOffset: -0,
                          markerType: MarkerType.circle,
                          enableAnimation: true,
                          onValueChangeEnd: handlePointerValueChanged,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Row(children: <Widget>[
                              Container(
                                child: Text(
                                  '$_annotationValue',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Times',
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF000000)),
                                ),
                              ),
                              Text(
                                '°C ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Times',
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF000000)),
                              )
                            ]),
                            positionFactor: 1.45,
                            angle: 2)
                      ],
                    )
                  ],
                ),
                Positioned(
                    bottom: 2,
                    top: 190,
                    left: 90,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange),
                        child: Text(
                          "Press to Set",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "Temperature Sent to Device",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                          );
                        })),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}

String _annotationValue = '10';
