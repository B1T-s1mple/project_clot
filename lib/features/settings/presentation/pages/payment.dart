import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/core/constants/images/app_images.dart';
import 'package:scot/features/settings/cubit/cubit_card/get_card_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_card/get_card_state.dart';
import 'package:scot/features/settings/presentation/pages/add_card.dart';
import 'package:scot/features/settings/cubit/cubit_Address/get_adress_state.dart';
import 'package:scot/features/settings/presentation/repo/get_card_repo.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCardCubit(GetCardRepo())..getcards(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 24),
          leading: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColor.secondaryColors,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'Payment',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.secondaryColors,
              ),
              onPressed: () async {
                // Yangi karta qo'shib qaytganda ro'yxatni yangilash
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCard()),
                );
                if (context.mounted) {
                  context.read<GetCardCubit>().getcards();
                }
              },
              icon: const Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text(
                'Cards',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(height: 15),

              // BlocBuilder orqali yuklanish, xato va muvaffaqiyat holatlarini ushlaymiz
              Expanded(
                child: BlocBuilder<GetCardCubit, GetCardState>(
                  builder: (context, state) {
                    if (state is GetAddressesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      );
                    }

                    if (state is GetcardError) {
                      return Center(
                        child: Text(
                          state.error,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }

                    if (state is Getcardsucces) {
                      final cardList = state.addresses;

                      if (cardList.isEmpty) {
                        return const Center(
                          child: Text(
                            "Sizda hali kartalar mavjud emas",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: cardList.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final currentCard = cardList[index];
                          final String cardNumber =
                              currentCard['card_number'] ?? '**** 41870';

                          return InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {},
                            child: Container(
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.secondaryColors,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        cardNumber,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Image.asset(
                                      AppImages.master_card,
                                      width: 40,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.credit_card),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Paypal',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(height: 15),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Container(
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.secondaryColors,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text('Cloth@gmail.com', style: TextStyle(fontSize: 16)),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
