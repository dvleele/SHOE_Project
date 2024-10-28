import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  // Các biến trạng thái để lưu trữ tình trạng của từng checkbox
  bool _isCheckedS = false;
  bool _isCheckedM = false;
  bool _isCheckedL = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E2DD),
      appBar: AppBar(
        backgroundColor: Color(0xffE4E2DD),
        centerTitle: true,
        title: Text(
          "Đăng sản phẩm",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Center(
                            child: Text(
                              "Tải ảnh",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: ' Tiêu đề',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: ' Mô tả',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: ' Giá',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "  Size",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        // Checkbox cho các kích cỡ
                        CheckboxListTile(
                          title: Text("S"),
                          value: _isCheckedS,
                          onChanged: (value) {
                            setState(() {
                              _isCheckedS = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("M"),
                          value: _isCheckedM,
                          onChanged: (value) {
                            setState(() {
                              _isCheckedM = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("L"),
                          value: _isCheckedL,
                          onChanged: (value) {
                            setState(() {
                              _isCheckedL = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "  Mẫu",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        // Checkbox cho các kích cỡ
                        CheckboxListTile(
                          title: Text("Nike"),
                          value: _isCheckedS,
                          onChanged: (value) {
                            setState(() {
                              _isCheckedS = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("Adidas"),
                          value: _isCheckedM,
                          onChanged: (value) {
                            setState(() {
                              _isCheckedM = value ?? false;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text("Puma"),
                          value: _isCheckedL,
                          onChanged: (value) {
                            setState(() {
                              _isCheckedL = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        "Đăng",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
