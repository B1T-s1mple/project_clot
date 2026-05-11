import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'My Favourites',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        toolbarHeight: 80,
      ),
      body: GridView.builder(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          mainAxisExtent: 281,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 161,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.secondaryColors,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
