import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return primary_button(ontap: (){});
  }
}

primary_button({ required Function ontap}) {
  return SizedBox(
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColors),

      onPressed: () {
        ontap();
      },
      child: Center(
        child: Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
