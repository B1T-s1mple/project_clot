import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class XzPage extends StatefulWidget {
  const XzPage({super.key});

  @override
  State<XzPage> createState() => _XzPageState();
}

class _XzPageState extends State<XzPage> {
  String? yosh;
  bool men = true;
  bool women = false;
  final age = TextEditingController();
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
                  onTap: () {
                    setState(() {
                      men = true;
                      women = false;
                    });
                  },
                  child: Container(
                    width: 179,
                    height: 52,
                    decoration: BoxDecoration(
                      color: men
                          ? AppColor.primaryColors
                          : AppColor.secondaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Men',
                        style: TextStyle(
                          color: men ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    setState(() {
                      men = false;
                      women = true;
                    });
                  },
                  child: Container(
                    width: 179,
                    height: 52,
                    decoration: BoxDecoration(
                      color: women
                          ? AppColor.primaryColors
                          : AppColor.secondaryColors,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Women',
                        style: TextStyle(
                          color: women ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 56),
            Row(children: [Text('How Old are you ?')]),
            TextField(
              controller: age,
              decoration: InputDecoration(
                contentPadding: .symmetric(vertical: 22),
                focusedBorder: OutlineInputBorder(
                  borderRadius: .circular(100),
                  borderSide: BorderSide(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: .circular(100),
                  borderSide: BorderSide(),
                ),
                filled: true,
                prefix: Padding(padding: .only(left: 16)),
                hintText: 'Age Range',
                hintStyle: TextStyle(fontSize: 16),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: PopupMenuButton<String>(
                    tooltip: '',
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    ),
                    onSelected: (value) {
                      age.text = value;
                    },
                    itemBuilder: (context) =>
                        <String>[
                          '5 - 12',
                          '13 - 17',
                          '18 - 24',
                          '25 - 34',
                          '35 - 44',
                        ].map((age) {
                          return PopupMenuItem<String>(
                            value: age,
                            child: Text(age, style: TextStyle(fontSize: 15)),
                          );
                        }).toList(),
                  ),
                ),
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
