import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';
import 'package:scot/features/settings/cubit/cubit_card/add_card_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_card/add_card_state.dart';
import 'package:scot/features/settings/presentation/pages/payment.dart';

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
  void dispose() {
    // TODO: implement dispose
    controllercard.dispose();
    controllerccv.dispose();
    controllerexp.dispose();
    controllername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Add Card',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          spacing: 12,
          children: [
            const SizedBox(height: 25),
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
                const SizedBox(width: 12),
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

            const Spacer(),
            SizedBox(
              height: 50,
              child: BlocConsumer<AddCardCubit, AddCardState>(
                listener: (context, state) {
                  if (state is AddDed) {}
                  if (state is AddcardError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is Addcardloading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: AppColor.primaryColors,
                    ),

                    onPressed: () {
                      if (controllercard.text.isNotEmpty &&
                          controllerccv.text.isNotEmpty &&
                          controllerexp.text.isNotEmpty &&
                          controllername.text.isNotEmpty) {
                        final request = CardModel(
                          cardNumber: controllercard.text.trim(),
                          cardholderName: controllername.text.trim(),
                          ccv: controllerccv.text.trim(),
                          exp: controllerexp.text.trim(),
                        );

                        context.read<AddCardCubit>().addcard(request);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Payment(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Iltimos, barcha maydonlarni to'ldiring!",
                            ),
                          ),
                        );
                      }
                    },

                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
