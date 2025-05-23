import 'package:delivery/core/di/di.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';

import 'package:delivery/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getHomeData(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                List<Orders> orders = state.homeEntity?.orders ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: OrderCard(
                              order: orders[index],
                              primaryColor: ColorManager.primaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        ' rider',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: ColorManager.primaryColor,
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Orders order;
  final Color primaryColor;

  const OrderCard({super.key, required this.order, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'رقم الاوردر :${order.orderNumber}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('Pickup address'),
            const SizedBox(height: 8),
            _buildAddressInfo(
              isStore: true,
              iconWidget: CircleAvatar(
                radius: 20,
                backgroundColor: primaryColor.withOpacity(0.15),
                // Lighter pink for store icon bg
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_florist, size: 16, color: primaryColor),
                    Text(
                      order.user?.name ?? '',
                      style: TextStyle(
                        fontSize: 6,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              name: order.user?.phone??'',
              address: order.userAddress?.city??'',
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('User address'),
            const SizedBox(height: 8),
            // _buildAddressInfo(
            //   isStore: false,
            //
            //   name: order.userName,
            //   address: order.userAddress, iconWidget: SizedBox(),
            // ),
            // const SizedBox(height: 20),
            // Row(
            //   children: [
            //     Text(
            //       '${order.currency} ${order.price}',
            //       style: const TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     const Spacer(),
            //     Expanded(
            //       flex: 2, // Give buttons more space
            //       child: OutlinedButton(
            //         onPressed: () {
            //           // Handle reject
            //           print('Order Rejected');
            //         },
            //         style: OutlinedButton.styleFrom(
            //           foregroundColor: primaryColor,
            //           side: BorderSide(color: primaryColor),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20.0),
            //           ),
            //           padding: const EdgeInsets.symmetric(vertical: 10),
            //         ),
            //         child: const Text('Reject'),
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //     Expanded(
            //       flex: 2,
            //       child: ElevatedButton(
            //         onPressed: () {
            //           // Handle accept
            //           print('Order Accepted');
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: primaryColor,
            //           foregroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20.0),
            //           ),
            //           padding: const EdgeInsets.symmetric(vertical: 10),
            //         ),
            //         child: const Text('Accept'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600]));
  }

  Widget _buildAddressInfo({
    required Widget iconWidget,
    required String name,
    required String address,
    required bool isStore,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        address,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
