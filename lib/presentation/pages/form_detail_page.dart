import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walkfromhome/presentation/widgets/button.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({super.key});

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String? gender;

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nameController.dispose();
    _surNameController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 690.h,
          width: 360.w,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 100,
                    child: Container(
                      padding: EdgeInsets.only(left: 30.w),
                      width: 260.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ชื่อ-นามสกุล",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp)),
                          userDataTextfield(_nameController, "ชื่อ"),
                          SizedBox(height: 7.h),
                          userDataTextfield(_nameController, "นามสกุล"),
                          SizedBox(height: 20.h),
                          Text("น้ำหนัก(กิโลเมตร)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp)),
                          userDataTextfield(
                              _nameController, "กรุณากรอกน้ำหนัก"),
                          SizedBox(height: 20.h),
                          Text("ส่วนสูง(เซนติเมตร)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp)),
                          userDataTextfield(
                              _nameController, "กรุณากรอกส่วนสูง"),
                          SizedBox(height: 20.h),
                          Text("เพศ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp)),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 'male',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                              ),
                              Text('ชาย',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp)),
                              Radio(
                                value: 'female',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                              ),
                              Text('หญิง',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp)),
                            ],
                          )
                        ],
                      ),
                    )),
                Positioned(
                  right: 20,
                  top: 10,
                  child: Image.asset(
                    'assets/images/second_page_logo.png',
                    fit: BoxFit.contain,
                    width: 50.w,
                    height: 80.h,
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Image.asset(
                    'assets/images/second_page_logo.png',
                    fit: BoxFit.contain,
                    width: 50.w,
                    height: 80.h,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/elevenpage_2.png',
                    fit: BoxFit.contain,
                    width: 205.w,
                    height: 300.h,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 100,
                  child: Image.asset(
                    'assets/images/elevenpage_3.png',
                    fit: BoxFit.contain,
                    width: 30.w,
                    height: 420.h,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 40,
                  child: SizedBox(
                    width: 360.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          text: "Calibrate",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CustomButton(
                          text: "ถัดไป",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailUserPage()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userDataTextfield(TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center, // จัดตำแหน่ง hintText ให้อยู่ตรงกลาง
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        filled: true, // เปิดใช้งานพื้นหลัง
        fillColor:
            Color.fromARGB(255, 136, 50, 216), // กำหนดสีพื้นหลังเป็นสีม่วง
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // ขอบโค้ง 8
          borderSide: const BorderSide(color: Colors.transparent), // ขอบโปร่งใส
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // ขอบโค้ง 8
          borderSide: const BorderSide(color: Colors.transparent), // ขอบโปร่งใส
        ),
      ),
    );
  }
}
