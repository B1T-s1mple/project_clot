import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/filter/presentation/pages/widgets/one.dart';
import 'package:scot/features/filter/presentation/pages/widgets/three.dart';
import 'package:scot/features/filter/presentation/pages/widgets/two.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<Widget> control = [category(), not_found(), Three()];
  final serachcontroller = TextEditingController();
  int con = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: .min,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.secondaryColors,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 9),
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: serachcontroller,
                  onChanged: (value) {
                    setState(() {
                      // value - bu foydalanuvchi yozayotgan tekst
                      if (value.isEmpty) {
                        con = 0; // Hech narsa yozilmasa 'category'
                      } else if (value.toLowerCase() == 'jacket') {
                        con =
                            2; // 'jacket' deb yozsa natijalar (uchinchi widget)
                      } else {
                        con = 1; // Boshqa har qanday narsa yozsa 'not_found'
                      }
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        serachcontroller.text = '';
                      },
                      icon: Icon(Icons.close),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 14),
                    fillColor: AppColor.secondaryColors,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: control[con],
    );
  }
}
