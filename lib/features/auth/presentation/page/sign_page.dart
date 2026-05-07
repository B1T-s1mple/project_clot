import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/auth/presentation/page/create_page.dart';
import 'package:scot/features/auth/presentation/widgets/primary_button.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Sign in',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 51),
            TextFeldPrimary(hintTextl: 'Email'),
            SizedBox(height: 15),
            TextFeldPrimary(hintTextl: 'Password'),

            SizedBox(height: 27),
            PrimaryButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
              },
            ),
            SizedBox(height: 17),
            Row(
              children: [
                Text('Dont have an Account ?'),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePage()),
                    );
                  },
                  child: Text(
                    ' Create One',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(height: 71),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,

                  backgroundColor: AppColor.secondaryColors,
                ),

                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.apple, color: Colors.black, size: 36),
                    SizedBox(width: 60),
                    Text(
                      'Continue With Apple',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,

                  backgroundColor: AppColor.secondaryColors,
                ),

                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 7),
                    Image.asset(AppImages.googleicon, width: 24, height: 24),
                    SizedBox(width: 60),
                    Text(
                      'Continue With Google',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,

                  backgroundColor: AppColor.secondaryColors,
                ),

                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.facebook, color: Colors.blue, size: 36),
                    SizedBox(width: 60),
                    Text(
                      'Continue With Facebook',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
