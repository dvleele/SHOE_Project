import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoe_project/Admin/AdminHomePage.dart';

class Loginadmin extends StatefulWidget {
  const Loginadmin({super.key});

  @override
  State<Loginadmin> createState() => _LoginadminState();
}

class _LoginadminState extends State<Loginadmin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController admincontroller = TextEditingController();
  TextEditingController adminpasswordcontroller = TextEditingController();

  void Loginadmin() async {
    try {
      // Truy vấn Firestore để lấy tài khoản và mật khẩu
      var snapshot = await FirebaseFirestore.instance
          .collection('admin')
          .doc('NrkOYuHMa0pBvi0ea0Wg') // Sử dụng ID của fireStore
          .get();

      // Kiểm tra tài liệu có tồn tại
      if (snapshot.exists) {
        var data = snapshot.data();
        String storedUsername = data?['id'];
        String storedPassword = data?['password'];

        // So sánh với thông tin người dùng nhập vào
        if (storedUsername == admincontroller.text &&
            storedPassword == adminpasswordcontroller.text) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Adminhomepage()),
          );
        } else {
          ThatBai();
        }
      } else {
        ThatBai();
      }
    } catch (e) { // lỗi này bao gom tất ca
      ThatBai();
    }
  }

  void ThatBai() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          content: Container(
            height: 100,
            child: Center(
              child: Text(
                "Hãy kiểm tra lại tên tài khoản hoặc mật khẩu đăng nhập của bạn.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ),
          ],
        );
      },
    );
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
              Text(
                'Admin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: admincontroller,
                decoration: InputDecoration(
                  hintText: ' Username',
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
              TextFormField(
                controller: adminpasswordcontroller,
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
                onPressed: () {
                  Loginadmin();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'LOGN IN',
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
}
