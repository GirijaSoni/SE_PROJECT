import 'package:flutter/material.dart';
import 'package:photochatapp/screens/home/home_screen.dart';
import 'package:photochatapp/screens/login/SignUp.dart';
import 'package:photochatapp/services/AuthenticationService.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Text(
                  "STEGANOGRAPHY",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  onChanged: (String value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  validator: (String value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (value.isEmpty) {
                      return "Email is required!";
                    } else if (!regex.hasMatch(value)) {
                      return 'Email format is invalid';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Email"),
                  cursorColor: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (String value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Password is required!";
                    } else if (value.length < 6) {
                      return "Please provide a strong password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Password"),
                  cursorColor: Colors.grey,
                  obscureText: true,
                ),
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        bool check = await Provider.of<AuthenticationService>(
                                context,
                                listen: false)
                            .signIn(_email, _password);

                        if (check)
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 350,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "NO ACCOUNT YET? SIGNUP NOW",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
