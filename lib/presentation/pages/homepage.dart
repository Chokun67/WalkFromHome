import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walkfromhome/presentation/pages/howtopage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/ellipse_5.png',
              fit: BoxFit.cover,
              width: 360.w,
              height: 290.h,
            ),
          ),
          Positioned(
            left: 20.w,
            top: 260.h,
            child: Image.asset(
              'assets/images/second_apge_app_name.png',
              width: 130.w,
              height: 100.h,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 67.w,
            top: 215.h,
            child: Image.asset(
              'assets/images/second_page_logo.png',
              fit: BoxFit.contain,
              width: 100.w,
              height: 100.h,
            ),
          ),
          Positioned(
            left: 150.w,
            top: 285.h,
            child: Image.asset(
              'assets/images/seconde_page_name.png',
              fit: BoxFit.contain,
              width: 200.w,
              height: 20.h,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: 360.h), // ใช้ ScreenUtil สำหรับการปรับขนาด
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Howtopage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 63, 199, 68), // พื้นหลังปุ่มสีเขียว
                  foregroundColor: Colors.white, // ตัวอักษรสีขาว
                  padding:
                      EdgeInsets.symmetric(horizontal: 70.w, vertical: 8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r), // ขอบมน
                  ),
                ),
                child: Text("START", style: TextStyle(fontSize: 20.sp)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
