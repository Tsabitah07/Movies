import 'package:flutter/material.dart';
import 'package:movies/HomePage.dart';
import 'package:movies/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color buttonLogin = Colors.blueAccent;
  Color buttonRegister = Colors.blueAccent;

  void _onLoginPressed() {
    setState(() {
      buttonLogin = Colors.lightBlueAccent;
    });

    Future.delayed(Duration(milliseconds: 140), () {
      setState(() {
        buttonLogin = Colors.blueAccent;
      });
    });
  }

  void _onRegisterPressed() {
    setState(() {
      buttonRegister = Colors.lightBlueAccent;
    });

    Future.delayed(Duration(milliseconds: 140), () {
      setState(() {
        buttonRegister = Colors.blueAccent;
      });
    });
  }

  Widget myText(String label, bool isobscure){
    return Container(
        margin: EdgeInsets.only(left: 13, right: 13, top: 17),
        child: TextField(
          obscureText: isobscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOGIN PAGE"),),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WELCOME BACK-!!",
              style: TextStyle(
                fontSize: 23
              ),),
              myText("Username", false),
              myText("Password", true),

              //elevated button login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13,right: 13, top: 27, bottom: 83),
                    width: 107,
                    height: 47,
                    child: ElevatedButton(
                      onPressed:  () {
                        _onLoginPressed();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      child: Text('Login', style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                      )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 13,right: 13, top: 27, bottom: 83),
                    width: 137,
                    height: 47,
                    child: ElevatedButton(
                      onPressed:  () {
                        _onRegisterPressed();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Text('Register', style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
