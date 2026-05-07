import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class XzPage extends StatefulWidget {
  const XzPage({super.key});

  @override
  State<XzPage> createState() => _XzPageState();
}

class _XzPageState extends State<XzPage> {
  String? yosh;
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
                  'Tell us About yourself',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 51),
            Row(children: [Text('Who do you shop for ?')]),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {},
                  child: Container(
                    width: 179,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text('Men', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {},
                  child: Container(
                    width: 179,
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Women',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 56),
            Row(children: [Text('How Old are you ?')]),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.secondaryColors,
              ),
              width: double.infinity,
              child: DropdownButton<String>(
                menuWidth: 342,
                underline: null,
                dropdownColor: AppColor.secondaryColors,
                focusColor: AppColor.secondaryColors,

                menuMaxHeight: 56,
                value: yosh,
                hint: Text('Age Range'),
                items: [
                  DropdownMenuItem(value: '10-14', child: Text('10-14')),
                  DropdownMenuItem(value: '14-18', child: Text('14-18')),
                  DropdownMenuItem(value: '22-26', child: Text('22-26')),
                ],
                onChanged: (value) {
                  setState(() {
                    yosh = value;
                  });
                },
              ),
            ),
            Spacer(),
            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColors,
                ),

                onPressed: () {},
                child: Center(
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
