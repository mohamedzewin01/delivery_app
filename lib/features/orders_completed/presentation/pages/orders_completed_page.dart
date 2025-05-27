import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
import 'package:delivery/core/widgets/custom_app_bar.dart';
import 'package:delivery/core/widgets/rial_icon.dart';
import 'package:delivery/features/orders_completed/data/models/response/order_completed_dto.dart';
import 'package:delivery/features/orders_completed/presentation/widgets/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../bloc/orders_completed_cubit.dart';

class OrdersCompletedPage extends StatefulWidget {
  const OrdersCompletedPage({super.key});

  @override
  State<OrdersCompletedPage> createState() => _OrdersCompletedPageState();
}

class _OrdersCompletedPageState extends State<OrdersCompletedPage> {
  late OrdersCompletedCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<OrdersCompletedCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getOrdersCompleted(),
      child: Scaffold(
        appBar:  CustomAppBar(title: 'الاوردات المكتملة'),
        body: Column(
          children: [


            BlocConsumer<OrdersCompletedCubit, OrdersCompletedState>(
              listener: (context, state) {
                // if (state is OrdersCompletedFail) {
                //   // CustomDialog.showErrorDialog(context, message: state.exception.toString());
                // }
              },
              builder: (context, state) {
                if (state is OrdersCompletedSuccess) {
                  List<OrdersCompleted>? cartItems =
                      state.orderCompletedEntity?.orders ?? [];
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 8,
                                    right: 8,
                                    left: 8,
                                    bottom: 65,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(
                                          parent: BouncingScrollPhysics(),
                                        ),
                                        itemBuilder: (context, index) {
                                          return CartCompletedOrderItemCard(
                                            index: index,
                                            cartItem: cartItems[index],
                                          );
                                        },
                                        itemCount: cartItems.length,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: CircularProgressIndicator(color: ColorManager.primaryColor)),
                    ],
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

class CartCompletedOrderItemCard extends StatefulWidget {
  const CartCompletedOrderItemCard({
    super.key,
    required this.index,
    required this.cartItem,
  });

  final int index;
  final OrdersCompleted cartItem;

  @override
  State<CartCompletedOrderItemCard> createState() =>
      _CartCompletedOrderItemCardState();
}

class _CartCompletedOrderItemCardState
    extends State<CartCompletedOrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
      child: Card(
        color: ColorManager.white.withAlpha(240),
        // elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),

          splashColor: ColorManager.primaryColor.withAlpha(200),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetails(order: widget.cartItem),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(8),
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'تاريخ الطلب',
                        style: getSemiBoldStyle(
                          color: ColorManager.indigoDark2,
                          fontSize: 14,
                        ),
                      ),
                      const TextSpan(
                        text: ' : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextSpan(
                        text: '${widget.cartItem.updatedAt}',
                        style: getSemiBoldStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 14,
                        ), // أو لون مختلف
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F4F8),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[200]!, width: 1),
                      ),
                      child: Text(
                        widget.cartItem.orderNumber ?? '',
                        style: getSemiBoldStyle(
                          color: ColorManager.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              AutoSizeText(
                                "عدد المنتجات",
                                style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: 14,
                                ),
                              ),
                              AutoSizeText(
                                '${widget.cartItem.orderItems?.length}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              AutoSizeText(
                                "مبلغ الطلب",
                                style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${widget.cartItem.totalPrice?.toStringAsFixed(2)}',
                                    style: getSemiBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  RialIcon(color: ColorManager.black, size: 10),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              AutoSizeText(
                                "حالة الطلب",
                                style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: 14,
                                ),
                              ),

                              AutoSizeText(
                                widget.cartItem.status ?? '',
                                style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
