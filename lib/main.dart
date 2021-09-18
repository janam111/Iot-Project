import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_9/paths/routes.dart';
import 'package:flutter_application_9/ui/startscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SMVDU IOT APP',
        routes: AppRoutes.define(),
        home: OpeningView());
  }
}
