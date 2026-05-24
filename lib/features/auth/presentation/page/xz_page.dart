
import 'package:flutter/material.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';
import 'package:scot/features/auth/presentation/page/sign_page.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
import 'package:scot/features/home/presentation/widgets/bar.dart';

class XzPage extends StatefulWidget {
  final int userId;
  const XzPage({super.key, required this.userId});

  @override
  State<XzPage> createState() => _XzPageState();
}

class _XzPageState extends State<XzPage> {
  final AuthRepo _authRepo = AuthRepo();
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
            const Row(
              children: [
                Text(
                  'Tell us About yourself',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 51),
            const Row(children: [Text('Who do you shop for ?')]),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const SizedBox(height: 56),
            const Row(children: [Text('How Old are you ?')]),
            const SizedBox(height: 15),
            TextField(
              controller: age,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 22),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                prefix: const Padding(padding: EdgeInsets.only(left: 16)),
                hintText: 'Age Range',
                hintStyle: const TextStyle(fontSize: 16),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: PopupMenuButton<String>(
                    tooltip: '',
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    ),
                    onSelected: (value) {
                      age.text = value;
                    },
                    itemBuilder: (context) => <String>['under 18'].map((age) {
                      return PopupMenuItem<String>(
                        value: age,

                        child: Text(age, style: const TextStyle(fontSize: 15)),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColors,
                ),

                onPressed: () async {
                  String gender = men ? "Men" : "Women";

                  try {
                    await _authRepo.completeProfile(
                      request: AgePrifile(gender: gender, age: age.text),
                      userId: widget.userId,
                    );

                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignPage()),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  }
                },
                child: const Center(
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
