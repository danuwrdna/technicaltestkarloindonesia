import 'package:flutter/material.dart';
import 'package:technical_test_karlo_indonesia/widget/custombutton.dart';
import 'package:technical_test_karlo_indonesia/widget/customtext.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 139, 8),
        title: Center(
            child: CustomText(
          text: "Technical Test ",
          color: Colors.white,
          size: 22,
          fontWeight: FontWeight.w600,
          align: TextAlign.center,
        )),
      ),
      body: Container(
        color: const Color.fromARGB(255, 3, 139, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/splashmaps.jpg',
                  height: 130,
                  width: 130,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: "Aplikasi ini dibuat oleh \n Drajat Danu Wardana ",
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.center)
              ],
            ),
            const SizedBox(
              height: 430,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        text: "Lanjut >",
                        height: 50,
                        width: 120,
                        color: Colors.white,
                        colorText: Colors.black,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        }),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
