import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth_firebase/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(
                  Icons.person_outline,
                  size: 25,
                  color: Color(0xffA6B0BD),
                ),
                isCollapsed: false,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  icon: Icon(
                    Icons.lock,
                    size: 25,
                    color: Color(0xffA6B0BD),
                  ),
                  isCollapsed: false,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                  color: Theme.of(context).accentColor,
                  child: Text('Sign In'),
                  onPressed: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
              // ignore: deprecated_member_use
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('Sign Up'),
                  onPressed: () {
                    auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  })
            ],
          )
        ],
      ),
    );
  }
}
