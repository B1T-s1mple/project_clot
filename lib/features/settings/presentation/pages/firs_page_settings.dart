import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/page/sign_page.dart';
import 'package:scot/features/settings/cubit/cubit_profil/profil_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_profil/profil_state.dart';
import 'package:scot/features/settings/presentation/pages/adress.dart';
import 'package:scot/features/settings/presentation/pages/payment.dart';
import 'package:scot/features/settings/presentation/pages/wishlist.dart';

class FirsPageSettings extends StatefulWidget {
  const FirsPageSettings({super.key});

  @override
  State<FirsPageSettings> createState() => _FirsPageSettingsState();
}

class _FirsPageSettingsState extends State<FirsPageSettings> {
  final List<String> texts = [
    "Address",
    "Wishlist",
    "Payment",
    "Help",
    "Support",
  ];
  final List<Widget> pages = [
    const Adress(),
    const Wishlist(),
    const Payment(),
  ];
  @override
  void initState() {
    context.read<ProfilCubit>().getinfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<ProfilCubit, ProfilState>(
        builder: (context, state) {
          if (state is ProfilLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfilError) {
            return Center(child: Text(state.message));
          } else if (state is ProfilLoaded) {
            final profil = state.profileInfolar;
            print("${profil[0].addresses} ///////////////////////////qaspkojihugyftcgvhbjnokp");
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(profil[0].imageUrl),

                        backgroundColor: AppColor.secondaryColors,
                      ),
                    ],
                  ),
                  const SizedBox(height: 38),
                  Container(
                    height: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.secondaryColors,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "${profil[0].firstName.toString()}  ${profil[0].lastName.toString()}",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                profil[0].email.toString(),
                                style: TextStyle(
                                  color: const Color(
                                    0xFF27272780,
                                  ).withValues(alpha: 0.5),
                                ),
                              ),
                              Text(
                                ' ${profil[0].phone.toString()}',
                                style: TextStyle(
                                  color: const Color(
                                    0xFF27272780,
                                  ).withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.primaryColors,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(34567),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pages[index],
                            ),
                          );
                        },
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.secondaryColors,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text('${texts[index]}'),
                                const Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: texts.length,
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
