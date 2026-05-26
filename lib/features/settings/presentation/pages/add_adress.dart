import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/auth/presentation/widgets/text_feld_primary.dart';
import 'package:scot/features/settings/cubit/cubit_Address/addadres_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_Address/addadres_state.dart';
import 'package:scot/features/settings/model/add_adress_model.dart';
import 'package:scot/features/settings/presentation/pages/adress.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final controllerStreet = TextEditingController();
  final controllerstate = TextEditingController();
  final controllercode = TextEditingController();
  final controllercity = TextEditingController();
  @override
  @override
  void dispose() {
    // TODO: implement dispose
    controllerStreet.dispose();
    controllercity.dispose();
    controllercode.dispose();
    controllerstate.dispose();
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
          ' Add Adress',
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
              hintTextl: 'Street Address',
              controlerprimary: controllerStreet,
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
                const SizedBox(width: 12),
                Expanded(
                  child: TextFeldPrimary(
                    hintTextl: 'Zip Code',
                    controlerprimary: controllercode,
                  ),
                ),
              ],
            ),
            const Spacer(),
            BlocConsumer<AddadresCubit, AddadresState>(
              listener: (context, state) {
                if (state is AddDed) {}
                if (state is AddadresError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AddadresLoadind) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: AppColor.primaryColors,
                  ),

                  onPressed: () {
                    if (controllerStreet.text.isNotEmpty &&
                        controllercity.text.isNotEmpty &&
                        controllercode.text.isNotEmpty &&
                        controllerstate.text.isNotEmpty) {
                      final request = AddAdressModel(
                        city: controllercity.text.trim(),
                        state: controllerstate.text.trim(),
                        zipCode: controllercode.text.trim(),
                        street: controllerStreet.text.trim(),
                      );

                      context.read<AddadresCubit>().adadres(request);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Adress()),
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
