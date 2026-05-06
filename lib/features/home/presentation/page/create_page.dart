import 'package:flutter/material.dart';
import 'package:scot/features/home/presentation/page/forgot_page.dart';
import 'package:scot/features/home/presentation/widgets/primary_button.dart';
import 'package:scot/features/home/presentation/widgets/text_feld_primary.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
                  'Create Account',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 51),
            text_feld_primary(hintText: 'Firstname'),
            SizedBox(height: 15),
            text_feld_primary(hintText: 'Lastname'),
            SizedBox(height: 15),
            text_feld_primary(hintText: 'Email Address'),
            SizedBox(height: 15),
            text_feld_primary(hintText: 'Password'),
            SizedBox(height: 40),
            primary_button(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPage()),
                );
              },
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Text('Forgot Password ? '),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPage()),
                    );
                  },
                  child: Text(
                    ' Reset',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
