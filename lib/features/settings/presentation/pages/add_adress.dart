import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final controllerAdres = TextEditingController();
  final controllerstate = TextEditingController();
  final controllercode = TextEditingController();
  final controllercity = TextEditingController();

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
          ' Add Adress',
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
              hintTextl: 'Street Address',
              controlerprimary: controllerAdres,
            ),
            TextFeldPrimary(
              hintTextl: 'city',
              controlerprimary: controllercity,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFeldPrimary(
                    hintTextl: 'State',
                    controlerprimary: controllerstate,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFeldPrimary(
                    hintTextl: 'Zip Code',
                    controlerprimary: controllercode,
                  ),
                ),
              ],
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
