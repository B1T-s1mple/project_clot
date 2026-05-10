import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/home/presentation/pages/home_products_page.dart';

class HomeCategoriesPage extends StatefulWidget {
  const HomeCategoriesPage({super.key});

  @override
  State<HomeCategoriesPage> createState() => _HomeCategoriesPageState();
}

class _HomeCategoriesPageState extends State<HomeCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        titleSpacing: 24,
        title: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColor.secondaryColors,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Shop by Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 14),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeProductsPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 342,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColors,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [SizedBox(width: 20), Text('Hodies')],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
