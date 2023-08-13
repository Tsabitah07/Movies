import 'package:flutter/material.dart';
import 'package:movies/HomePage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color buttonLogin = Colors.black38;
  Color buttonRegister = Colors.black38;

  void _onLoginPressed() {
    setState(() {
      buttonLogin = Colors.grey;
    });

    Future.delayed(Duration(milliseconds: 140), () {
      setState(() {
        buttonLogin = Colors.black38;
      });
    });
  }

  void _onRegisterPressed() {
    setState(() {
      buttonRegister = Colors.grey;
    });

    Future.delayed(Duration(milliseconds: 140), () {
      setState(() {
        buttonRegister = Colors.black38;
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
      appBar: AppBar(title: Text("REGISTER PAGE"),),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WELCOME NEW PEOPLE-!!",
                style: TextStyle(
                    fontSize: 23
                ),),
              myText("Email", false),
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
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: buttonLogin
                      ),
                      child: Text('Login', style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
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
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: buttonRegister
                      ),
                      child: Text('Register', style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
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
