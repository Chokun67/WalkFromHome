import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walkfromhome/constants/strings.dart';
import 'package:walkfromhome/presentation/pages/formpage.dart';
import 'package:walkfromhome/presentation/widgets/button.dart';

class Howtopage extends StatefulWidget {
  const Howtopage({super.key});

  @override
  State<Howtopage> createState() => _HowtopageState();
}

class _HowtopageState extends State<Howtopage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            left: 40,
            top: 0,
            child: Image.asset(
              'assets/images/eighth_page_text.png',
              fit: BoxFit.contain,
              width: 170.w,
              height: 100.h,
            ),
          ),
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
            left: 0,
            top: 100.h, // ใช้ ScreenUtil เพื่อกำหนดตำแหน่งตามสัดส่วนหน้าจอ
            right: 0,
            child: SizedBox(
              width: double.infinity,
              height: 350.h,
              child: SingleChildScrollView(
                child: Text(
                  AppStrings.description,
                  style: TextStyle(
                    fontSize: 17.sp, // ใช้ ScreenUtil สำหรับขนาดฟอนต์
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 530,
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  'ข้อความที่ต้องการแสดง',
                  style: TextStyle(
                    fontSize: 17.sp,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 600,
            child: SizedBox(
              width: 360.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    text: "ย้อนกลับ",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    text: "ถัดไป",
                    onPressed: () {
                      if (isChecked == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Formpage()),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
