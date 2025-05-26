import 'package:delivery/core/di/di.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/firebase_utils.dart';

import 'package:delivery/core/widgets/custom_elevated_button.dart';
import 'package:delivery/core/widgets/custom_sliver_app_bar.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:delivery/features/order_details/presentation/bloc/order_details_cubit.dart';
import 'package:delivery/features/order_details/presentation/widgets/custom_elevated_button_driver.dart';
import 'package:delivery/features/order_details/presentation/widgets/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({
    super.key,
    required this.orderId,
    required this.currentStageIndex,
  });

  final String orderId;
  final int currentStageIndex;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late OrderDetailsCubit viewModel;

  late int currentStageIndex;

  @override
  void initState() {
    currentStageIndex = widget.currentStageIndex;
    viewModel = getIt.get<OrderDetailsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  CustomSliverAppBar(title: 'تفاصيل الطلبية'),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: 5.0,
                            decoration: BoxDecoration(
                              color: index <= currentStageIndex
                                  ? ColorManager.green
                                  : ColorManager.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                      future: FirebaseUtils.getOrderById(widget.orderId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData) {
                          return const Center(child: Text('Order not found.'));
                        }

                        final order = snapshot.data;
                        return OrderDetailsBody(order: order);
                      },
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButtonDriver(
              title: Constants.getButtonLabel(
                Constants.orderStages[currentStageIndex],
              ),
              onPressed: () async {
                if (currentStageIndex >= 4) {
                  Navigator.pop(context);
                }
                await viewModel.updateStatus(
                  status: Constants.orderStages[currentStageIndex + 1],
                  orderId: int.parse(widget.orderId),
                );
                DateTime now = DateTime.now();
                String formattedTime = DateFormat(
                  'yyyy-MM-dd HH:mm:ss',
                ).format(now);
                final existingOrder = await FirebaseUtils.getOrderById(widget.orderId);


                String acceptedAtTime = existingOrder?.acceptedAt ?? '';
                String preparingAtTime = existingOrder?.preparingAt ?? '';
                String outDeliveryAtTime = existingOrder?.outDeliveryAt ?? '';

                if(currentStageIndex == 0){
                  acceptedAtTime=DateFormat(
                    'yyyy-MM-dd HH:mm:ss',
                  ).format(now);
                }
                if(currentStageIndex == 1){
                  preparingAtTime=DateFormat(
                    'yyyy-MM-dd HH:mm:ss',
                  ).format(now);
                }
                if(currentStageIndex == 2){
                  outDeliveryAtTime=DateFormat(
                    'yyyy-MM-dd HH:mm:ss',
                  ).format(now);
                }
                currentStageIndex++;
                setState(() {});
                await FirebaseUtils.updateOrderState(
                  orderId: widget.orderId,
                  updatedData: OrderStateModel(
                    acceptedAt:acceptedAtTime ,
                    preparingAt: preparingAtTime,
                    outDeliveryAt:outDeliveryAtTime ,
                    updatedAt: formattedTime,
                    status: Constants.orderStages[currentStageIndex ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


