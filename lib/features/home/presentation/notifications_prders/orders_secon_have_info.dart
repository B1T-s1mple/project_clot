import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/core/constants/color/app_color.dart';
import 'package:scot/features/home/cubit/cubit/order_cubit.dart';
import 'package:scot/features/home/cubit/cubit/order_state.dart';
import 'package:scot/features/home/presentation/notifications_prders/inside_order.dart';

class OrdersSeconHaveInfo extends StatefulWidget {
  const OrdersSeconHaveInfo({super.key});

  @override
  State<OrdersSeconHaveInfo> createState() => _OrdersSeconHaveInfoState();
}

class _OrdersSeconHaveInfoState extends State<OrdersSeconHaveInfo> {
  final List<String> ordrepagecategoria = [
    "Processing",
    "Shipped",
    "Delivered",
    "Returned",
    "Cancelled",
  ];
  String selectedCategory = "Processing";
  @override
  void initState() {
    context.read<OrderCubit>().getOrders();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(
            height: 35,
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                List<String> dinamikKategoriyalar = ordrepagecategoria;

                if (state is OrdersLoaded) {
                  for (int i = 0; i < state.orders.length; i++) {
                    String status = state.orders[i].status;

                    if (!ordrepagecategoria.contains(status)) {
                      ordrepagecategoria.add(status);
                    }
                  }

                  if (ordrepagecategoria.isNotEmpty) {
                    dinamikKategoriyalar = ordrepagecategoria;
                  }
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemCount: dinamikKategoriyalar.length,
                  itemBuilder: (context, index) {
                    final currentCategory = dinamikKategoriyalar[index];
                    final isSelected =
                        selectedCategory.toLowerCase() ==
                        currentCategory.toLowerCase();

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: isSelected
                            ? AppColor.primaryColors
                            : const Color(0xFFF4F4F4),
                        foregroundColor: isSelected
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = currentCategory;
                        });
                      },
                      child: Text(currentCategory),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 13);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state is OrdersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OrdersError) {
                  return Center(child: Text(state.message));
                } else if (state is OrdersLoaded) {
                  print(state.orders.length);
                  return ListView.separated(
                    itemCount: state.orders.length,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemBuilder: (context, index) {
                      final orders = state.orders[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InsideOrder(id: orders.id.toString()),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 342,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.secondaryColors,
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Icon(Icons.receipt_long_sharp, size: 27),
                              ),
                              Column(
                                mainAxisAlignment: .center,
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    "Order ${orders.id}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "${orders.items.length} items",
                                    style: const TextStyle(
                                      color: Color(0xFF27272780),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
