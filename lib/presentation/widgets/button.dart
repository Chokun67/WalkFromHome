import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w, // ขนาดความกว้าง
      height: 38.h, // ขนาดความสูง
      decoration: BoxDecoration(
        color: Colors.white, // พื้นหลังขาว
        borderRadius: BorderRadius.circular(8.r), // ขอบมน
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // เงา
          ),
        ],
        border: Border.all(
            color: const Color.fromARGB(255, 130, 85, 208),
            width: 2.w), // กรอบสีม่วงอ่อน
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // ใช้พื้นหลังจาก Container
          shadowColor: Colors.transparent, // ใช้เงาจาก Container
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r), // ขอบมน
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, // ตัวอักษรสีดำ
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
