import 'package:flutter/material.dart';
import 'package:flutter_application_9/ui/authentication.dart';
import 'package:flutter_application_9/ui/register.dart';

class AppRoutes {
  AppRoutes._();

  static const String routeauth = '/auth-login';
  static const String routeregister = '/auth-register';

  static Map<String, WidgetBuilder> define() {
    return {
      routeauth: (context) => Authentication(),
      routeregister: (context) => Register(),
    };
  }
}
