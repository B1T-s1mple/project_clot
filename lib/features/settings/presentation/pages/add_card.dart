import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final controllercard = TextEditingController();
  final controllerccv = TextEditingController();
  final controllerexp = TextEditingController();
  final controllername = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 24),

        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.secondaryColors,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          ' Add Card',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 12,
          children: [
            SizedBox(height: 25),
            TextFeldPrimary(
              hintTextl: 'Card Number',
              controlerprimary: controllercard,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFeldPrimary(
                    hintTextl: 'CCV',
                    controlerprimary: controllerccv,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFeldPrimary(
                    hintTextl: 'Exp',
                    controlerprimary: controllerexp,
                  ),
                ),
              ],
            ),
            TextFeldPrimary(
              hintTextl: 'Cardholder Name',
              controlerprimary: controllername,
            ),

            Spacer(),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColors,
                ),

                onPressed: () {},

                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
