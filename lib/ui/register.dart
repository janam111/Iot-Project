import 'package:flutter/material.dart';
import 'package:flutter_application_9/net/flutterfire.dart';
import 'package:flutter_application_9/ui/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _repassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final logo = Image.asset(
      "assets/logomain.png",
      fit: BoxFit.contain,
    );
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: (Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gradient.png'), fit: BoxFit.cover),
            ),
            padding: EdgeInsets.all(36),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                logo,
                TextFormField(
                  controller: _username,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "James Bond",
                    labelText: "Username",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _emailField,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "something@email.com",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _passwordField,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _repassword,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Enter Password again",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: deviceWidth / 1.3,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.orangeAccent),
                  constraints: BoxConstraints(maxWidth: 200),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldNavigate =
                          await register(_emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuScreen()));
                      }
                    },
                    child: Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
