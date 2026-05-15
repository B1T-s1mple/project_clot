import 'package:flutter/material.dart';
import 'package:scot/features/auth/presentation/page/sent_email_adrres.dart';
import 'package:scot/features/auth/presentation/widgets/primary_button.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {


  @override
  Widget build(BuildContext context) {  final controlemail = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 51),
              TextFeldPrimary(hintTextl:  'Enter Email address', controlerprimary: controlemail,),
              SizedBox(height: 27),
              PrimaryButton(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SentEmailAdrres()),
                  );
                },
              ),
              SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
