import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walkfromhome/presentation/pages/form_detail_page.dart';
import 'package:walkfromhome/presentation/widgets/button.dart';

class FormHealthPage extends StatefulWidget {
  const FormHealthPage({super.key});

  @override
  State<FormHealthPage> createState() => _FormHealthPageState();
}

class _FormHealthPageState extends State<FormHealthPage> {
  final TextEditingController _heartRateController = TextEditingController();
  final TextEditingController _oxygenLevelController = TextEditingController();
  final TextEditingController _bloodPressureController =
      TextEditingController();

  @override
  void dispose() {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                        heartRateTextFormField(
                            _heartRateController, "ใส่ตัวเลขชีพจร"),
                        SizedBox(height: 12.h),
                        textLabelInfo("ปริมาณออกซิเจนในเลือด"),
                        heartRateTextFormField(
                            _oxygenLevelController, "ใส่ตัวเลขปริมาณออกซิเจน"),
                        SizedBox(height: 12.h),
                        textLabelInfo("ความดันโลหิต"),
                        heartRateTextFormField(
                            _bloodPressureController, "ใส่ตัวเลขความดันโลหิต"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.h),
                    width: 360.w,
                    child: Column(
                      children: [
                        Text(
                          "คุณมีความเหนื่อยระดับไหน",
                          style: TextStyle(
                            fontSize: 17.sp, // ใช้ ScreenUtil สำหรับขนาดฟอนต์
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buttonPlusMinus(false),
                            SizedBox(width: 20.w),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize:
                                    22.sp, // ใช้ ScreenUtil สำหรับขนาดฟอนต์
                                height: 1.5,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            buttonPlusMinus(true)
                          ],
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                            onTap: () {
                              showFatigueLevelDialog(context);
                            },
                            child: Text(
                              "กดเพื่อดูระดับความเหนื่อย",
                              style: TextStyle(
                                fontSize:
                                    13.sp, // ใช้ ScreenUtil สำหรับขนาดฟอนต์
                                height: 1.5,
                                decoration: TextDecoration
                                    .underline, // ขีดเส้นใต้ข้อความ
                              ),
                            )),
                        SizedBox(height: 40.h),
                        CustomButton(
                          text: "ถัดไป",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailUserPage()),
                            );
                          },
                        ),
                        SizedBox(height: 8.h),
                        CustomButton(
                          text: "ย้อนกลับ",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
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

  Widget heartRateTextFormField(
      TextEditingController controller, String hintText) {
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

  Widget buttonPlusMinus(isPlus) {
    return ElevatedButton(
      onPressed: () {
        // เพิ่มการกระทำที่คุณต้องการเมื่อปุ่มถูกกด
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple, // สีพื้นหลัง
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0), // ขอบมน
        ),
      ),
      child: Icon(
        isPlus ? Icons.add : Icons.remove, // ไอคอน + หรือ -
        color: Colors.white, // สีของไอคอนเป็นสีขาว
      ),
    );
  }

  void showFatigueLevelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.025),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width *
                0.95, // กำหนดขนาดกว้าง 95% ของหน้าจอ
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'แบบวัดระดับความเหนื่อย',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/tenth_pic_form.png',
                  fit: BoxFit.contain,
                  width: 280.w,
                  height: 380.h,
                ),
                const SizedBox(height: 20),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple, // สีพื้นหลัง
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0), // ขอบมน
                          ),
                        ),
                        child: Text(
                          "ปิด",
                          style:
                              TextStyle(color: Colors.white, fontSize: 17.sp),
                        ))),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
