import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Formpage extends StatefulWidget {
  const Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  // Create TextEditingController for each TextFormField
  final TextEditingController _heartRateController = TextEditingController();
  final TextEditingController _oxygenLevelController = TextEditingController();
  final TextEditingController _bloodPressureController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _heartRateController.dispose();
    _oxygenLevelController.dispose();
    _bloodPressureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.only(left: 30.w, top: 20.h),
                width: 230.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/nineth_page_text.png',
                      fit: BoxFit.contain,
                      height: 70.h,
                    ),
                    textLabelInfo("อัตราการเต้นหัวใจ"),
                    heartRateTextFormField(_heartRateController,"ใส่ตัวเลขชีพจร"),
                    SizedBox(height: 12.h),
                    textLabelInfo("ปริมาณออกซิเจนในเลือด"),
                    heartRateTextFormField(_oxygenLevelController,"ใส่ตัวเลขปริมาณออกซิเจน"),
                    SizedBox(height: 12.h),
                    textLabelInfo("ความดันโลหิต"),
                    heartRateTextFormField(_bloodPressureController,"ใส่ตัวเลขความดันโลหิต"),
                  ],
                ),
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
          ],
        ),
      ),
    );
  }

  Widget textLabelInfo(String labels) {
    return Text(
      labels,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget heartRateTextFormField(TextEditingController controller,String hintText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
