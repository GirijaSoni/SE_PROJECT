import 'package:flutter/material.dart';
import 'package:photochatapp/screens/home/home_screen.dart';

import 'login.dart';
class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUp() ;
  }

}

class _SignUp extends State<SignUp> {
  String _email = '';
  String _firstname= '';
  String _lastname='';
  String _password = '';
  String _newpassword = '';
  bool _isLoading = false;

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
          child: Column(
            children:<Widget> [
              SizedBox(height: 100,),
              Text("STEGANOGRAPHY",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.amber,fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (String value) {
                  setState(() {
                    _firstname= value;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "First name is required!";
                  }  else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "First Name"),
                cursorColor: Colors.grey,

              ),
              SizedBox(height: 20,),

              TextFormField(
                onChanged: (String value) {
                  setState(() {
                    _lastname= value;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Last name is required!";
                  }  else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "Last Name"),
                cursorColor: Colors.grey,

              ),
              SizedBox(height: 20,),
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
                height: 20,
              ),
              TextFormField(
                onChanged: (String value) {
                  setState(() {
                    _newpassword = value;
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
                    labelText: "Retype Password"),
                cursorColor: Colors.grey,
                obscureText: true,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 350,
                height: 50,

                child: RaisedButton(
                  color: Colors.amber,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  },
                  child: Text("SIGN UP",style:
                  TextStyle(fontSize: 15,color: Colors.white),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text("Already Have an account?",style: TextStyle(fontSize: 15,color: Colors.grey),),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Login()));
                    },
                    child: Text(" Login now",style: TextStyle(fontSize: 15,color: Colors.blue),)
                  )
                ],
              )

            ],
          ),
        )
        ,
      ),
    );
  }

}