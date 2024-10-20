import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoe_project/LognIn-SignUp/Service.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = AuthService();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E2DD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: ' Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color(0xffCCCCCC),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: ' Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color(0xffCCCCCC),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: ' Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Color(0xffCCCCCC),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _signUp() async {
    final user = await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null){
      print("Đăng kí thành công");
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print("Đăng kí thất bại");
    }
  }
}
