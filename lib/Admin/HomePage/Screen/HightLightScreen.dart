import 'package:flutter/material.dart';

class HightlightScreen extends StatefulWidget {
  const HightlightScreen({super.key});

  @override
  State<HightlightScreen> createState() => _HightlightScreenState();
}

class _HightlightScreenState extends State<HightlightScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE4E2DD),
      appBar: AppBar(
        backgroundColor: Color(0xffE4E2DD),
        centerTitle: true,
        title: Text(
          "Sản phẩm nổi bật",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                SizedBox( height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "  Sản phẩm",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      // Checkbox cho các kích cỡ
                      CheckboxListTile(
                        title: Text("SP nổi bật 1"),
                        value: _isChecked1,
                        onChanged: (value) {
                          setState(() {
                            _isChecked1 = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("SP nổi bật 2"),
                        value: _isChecked2,
                        onChanged: (value) {
                          setState(() {
                            _isChecked2 = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("SP nổi bật 3"),
                        value: _isChecked3,
                        onChanged: (value) {
                          setState(() {
                            _isChecked3 = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
