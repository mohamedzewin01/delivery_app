// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:delivery/core/resources/color_manager.dart';
// import 'package:delivery/core/resources/style_manager.dart';
// import 'package:delivery/core/widgets/custom_app_bar.dart';
// import 'package:delivery/core/widgets/rial_icon.dart';
// import 'package:delivery/features/orders_completed/data/models/response/order_completed_dto.dart';
// import 'package:delivery/features/orders_completed/presentation/widgets/order_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/di/di.dart';
// import '../bloc/orders_completed_cubit.dart';
//
// class OrdersCompletedPage extends StatefulWidget {
//   const OrdersCompletedPage({super.key});
//
//   @override
//   State<OrdersCompletedPage> createState() => _OrdersCompletedPageState();
// }
//
// class _OrdersCompletedPageState extends State<OrdersCompletedPage> {
//   late OrdersCompletedCubit viewModel;
//
//   @override
//   void initState() {
//     viewModel = getIt.get<OrdersCompletedCubit>();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: viewModel..getOrdersCompleted(),
//       child: Scaffold(
//         appBar:  CustomAppBar(title: 'الاوردات المكتملة'),
//         body: Column(
//           children: [
//
//
//             BlocConsumer<OrdersCompletedCubit, OrdersCompletedState>(
//               listener: (context, state) {
//                 // if (state is OrdersCompletedFail) {
//                 //   // CustomDialog.showErrorDialog(context, message: state.exception.toString());
//                 // }
//               },
//               builder: (context, state) {
//                 if (state is OrdersCompletedSuccess) {
//                   List<OrdersCompleted>? cartItems =
//                       state.orderCompletedEntity?.orders ?? [];
//                   return Expanded(
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: CustomScrollView(
//                             slivers: [
//                               SliverToBoxAdapter(
//                                 child: Container(
//                                   margin: EdgeInsets.only(
//                                     top: 8,
//                                     right: 8,
//                                     left: 8,
//                                     bottom: 65,
//                                   ),
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 8,
//                                     vertical: 8,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey.shade300),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(height: 8),
//                                       ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(
//                                           parent: BouncingScrollPhysics(),
//                                         ),
//                                         itemBuilder: (context, index) {
//                                           return CartCompletedOrderItemCard(
//                                             index: index,
//                                             cartItem: cartItems[index],
//                                           );
//                                         },
//                                         itemCount: cartItems.length,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//
//                 return Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(child: CircularProgressIndicator(color: ColorManager.primaryColor)),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CartCompletedOrderItemCard extends StatefulWidget {
//   const CartCompletedOrderItemCard({
//     super.key,
//     required this.index,
//     required this.cartItem,
//   });
//
//   final int index;
//   final OrdersCompleted cartItem;
//
//   @override
//   State<CartCompletedOrderItemCard> createState() =>
//       _CartCompletedOrderItemCardState();
// }
//
// class _CartCompletedOrderItemCardState
//     extends State<CartCompletedOrderItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
//       child: Card(
//         color: ColorManager.white.withAlpha(240),
//         // elevation: 4,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(10),
//
//           splashColor: ColorManager.primaryColor.withAlpha(200),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => OrderDetails(order: widget.cartItem),
//               ),
//             );
//           },
//           child: Container(
//             margin: EdgeInsets.all(8),
//             height: 60,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'تاريخ الطلب',
//                         style: getSemiBoldStyle(
//                           color: ColorManager.indigoDark2,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const TextSpan(
//                         text: ' : ',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//
//                       TextSpan(
//                         text: '${widget.cartItem.updatedAt}',
//                         style: getSemiBoldStyle(
//                           color: ColorManager.primaryColor,
//                           fontSize: 14,
//                         ), // أو لون مختلف
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFF0F4F8),
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey[200]!, width: 1),
//                       ),
//                       child: Text(
//                         widget.cartItem.orderNumber ?? '',
//                         style: getSemiBoldStyle(
//                           color: ColorManager.black,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Spacer(),
//                           Column(
//                             children: [
//                               AutoSizeText(
//                                 "عدد المنتجات",
//                                 style: getBoldStyle(
//                                   color: ColorManager.black,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               AutoSizeText(
//                                 '${widget.cartItem.orderItems?.length}',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: ColorManager.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Spacer(),
//                           Column(
//                             children: [
//                               AutoSizeText(
//                                 "مبلغ الطلب",
//                                 style: getBoldStyle(
//                                   color: ColorManager.black,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '${widget.cartItem.totalPrice?.toStringAsFixed(2)}',
//                                     style: getSemiBoldStyle(
//                                       color: ColorManager.black,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   RialIcon(color: ColorManager.black, size: 10),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Spacer(),
//                           Column(
//                             children: [
//                               AutoSizeText(
//                                 "حالة الطلب",
//                                 style: getBoldStyle(
//                                   color: ColorManager.black,
//                                   fontSize: 14,
//                                 ),
//                               ),
//
//                               AutoSizeText(
//                                 widget.cartItem.status ?? '',
//                                 style: getSemiBoldStyle(
//                                   color: ColorManager.black,
//                                   fontSize: 12,
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
        backgroundColor: Colors.grey[50],
        appBar: CustomAppBar(title: 'الطلبات المكتملة'),
        body: BlocConsumer<OrdersCompletedCubit, OrdersCompletedState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is OrdersCompletedSuccess) {
              List<OrdersCompleted>? cartItems =
                  state.orderCompletedEntity?.orders ?? [];

              // حالة عدم وجود طلبات
              if (cartItems.isEmpty) {
                return _buildEmptyState();
              }

              return Column(
                children: [
                  // عداد الطلبات المكتملة
                  _buildOrdersCounter(cartItems.length),

                  // قائمة الطلبات
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await viewModel.getOrdersCompleted();
                      },
                      color: ColorManager.primaryColor,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 80,
                          left: 16,
                          right: 16,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          return CartCompletedOrderItemCard(
                            index: index,
                            cartItem: cartItems[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }

            // حالة التحميل
            return _buildLoadingState();
          },
        ),
      ),
    );
  }

  Widget _buildOrdersCounter(int count) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.primaryColor.withOpacity(0.1),
            ColorManager.primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorManager.primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_rounded,
            color: ColorManager.primaryColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'إجمالي الطلبات المكتملة',
            style: getSemiBoldStyle(
              color: ColorManager.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.primaryColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              '$count',
              style: getBoldStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 60,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'لا توجد طلبات مكتملة',
            style: getBoldStyle(
              color: ColorManager.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'سيتم عرض الطلبات المكتملة هنا',
            style: getRegularStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ColorManager.primaryColor,
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          Text(
            'جاري تحميل الطلبات...',
            style: getMediumStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
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
    extends State<CartCompletedOrderItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(milliseconds: widget.index * 100), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetails(order: widget.cartItem),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // رقم الطلب والحالة
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.primaryColor,
                                ColorManager.primaryColor.withOpacity(0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.primaryColor.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.receipt_long,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.cartItem.orderNumber ?? '',
                                style: getBoldStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.green[200]!,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green[700],
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'مكتمل',
                                style: getSemiBoldStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.offWhite.withOpacity(0.7),
                                ColorManager.offWhite.withOpacity(0.9),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),

                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.cartItem.user?.name ?? '',
                                style: getBoldStyle(
                                  color: ColorManager.primaryColor,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 12),

                    // معلومات الطلب
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          // عدد المنتجات
                          Expanded(
                            child: _buildInfoItem(
                              icon: Icons.shopping_cart_outlined,
                              label: 'عدد المنتجات',
                              value: '${widget.cartItem.orderItems?.length ?? 0}',
                              color: ColorManager.primaryColor,
                            ),
                          ),

                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey[300],
                          ),

                          // المبلغ الإجمالي
                          Expanded(
                            child: _buildInfoItem(
                              icon: Icons.payments_outlined,
                              label: 'الإجمالي',
                              value: '${widget.cartItem.totalPrice ?? 0}',
                              color: Colors.orange[700]!,
                              isPrice: true,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // تاريخ الطلب
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'تاريخ الطلب:',
                          style: getMediumStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.cartItem.updatedAt ?? '',
                          style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    bool isPrice = false,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: getRegularStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        isPrice
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: getBoldStyle(
                color: ColorManager.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 4),
            RialIcon(size: 12),
          ],
        )
            : Text(
          value,
          style: getBoldStyle(
            color: ColorManager.black,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}