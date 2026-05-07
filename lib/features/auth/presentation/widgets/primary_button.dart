import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final Function? ontap;
  const PrimaryButton({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColors,
        ),

        onPressed: () {
          ontap!();
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
}
