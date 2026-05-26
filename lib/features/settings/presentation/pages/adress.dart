import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/settings/cubit/cubit_Address/get_adress_cubit.dart';
import 'package:scot/features/settings/cubit/cubit_Address/get_adress_state.dart';
import 'package:scot/features/settings/presentation/pages/add_adress.dart';
import 'package:scot/features/settings/presentation/repo/get_adres_repo.dart';

class Adress extends StatefulWidget {
  const Adress({super.key});

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAddressesCubit(GetAdresRepo())..fetchAddresses(),
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
            'Address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.secondaryColors,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddAdress()),
                );
                if (context.mounted) {
                  context.read<GetAddressesCubit>().fetchAddresses();
                }
              },
              icon: const Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<GetAddressesCubit, GetAddressesState>(
                builder: (context, state) {
                  if (state is GetAddressesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is GetAddressesError) {
                    return Center(
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  if (state is GetAddressesSuccess) {
                    final addressList = state.addresses;

                    if (addressList.isEmpty) {
                      return const Center(
                        child: Text("not found karochi"),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.separated(
                        itemCount: addressList.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final currentAddress = addressList[index];

                          final String fullAddress =
                              "${currentAddress['street']}, ${currentAddress['city']}, ${currentAddress['state']} ${currentAddress['zip_code']}";

                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.secondaryColors,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    fullAddress,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
