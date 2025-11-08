// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:delivery/core/resources/cashed_image.dart';
// import 'package:delivery/core/resources/color_manager.dart';
// import 'package:delivery/core/resources/style_manager.dart';
// import 'package:delivery/core/widgets/rial_icon.dart';
// import 'package:delivery/features/orders_completed/data/models/response/order_completed_dto.dart';
// import 'package:flutter/material.dart';
//
// class OrderDetails extends StatelessWidget {
//   const OrderDetails({super.key, required this.order});
//
//   final OrdersCompleted order;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               backgroundColor: ColorManager.indigoDark2,
//               elevation: 10,
//               pinned: false,
//               floating: true,
//               snap: true,
//               title: Text(
//                 'تفاصيل الطلب',
//                 style: getSemiBoldStyle(
//                   color: ColorManager.white,
//                   fontSize: 20,
//                 ),
//               ),
//               leading:InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   height: 10,
//                   width: 10,
//                   padding: EdgeInsets.only(right: 7),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey.shade200),
//                     color: Colors.white,
//                   ),
//                   child: Center(
//                     child: Icon(
//                       Icons.arrow_back_ios,
//                       size: 20,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'عدد المنتجات: ',
//                               style: getSemiBoldStyle(
//                                 color: ColorManager.indigoDark2,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             TextSpan(
//                               text: '${order.orderItems?.length}',
//                               style: getSemiBoldStyle(
//                                 color: ColorManager.primaryColor,
//                                 fontSize: 14,
//                               ), // أو لون مختلف
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 2,
//                         width: 80,
//                         color: ColorManager.indigoDark2,
//                       ),
//                       SizedBox(height: 8),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(
//                           parent: BouncingScrollPhysics(),
//                         ),
//                         itemBuilder: (context, index) {
//                           return OrderDetailsItemCard(
//                             index: index,
//                             cartItem: order.orderItems![index],
//                           );
//                         },
//                         itemCount: order.orderItems?.length,
//                       ),
//                       Column(
//                         children: [
//                           Divider(color: Colors.grey.shade300),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         'المبلغ الاجمالي:',
//                                         style: getSemiBoldStyle(
//                                           color: ColorManager.lightTextColor,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//
//                                     Text(
//                                       order.totalPrice?.toStringAsFixed(2) ?? '',
//                                       style: getSemiBoldStyle(
//                                         color: ColorManager.lightTextColor,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     RialIcon(
//                                       color: ColorManager.darkTextColor,
//                                       size: 14,
//                                     ),
//                                   ],
//                                 ),
//
//                                 SizedBox(height: 8),
//                                 Divider(color: Colors.grey.shade300),
//
//                                 SizedBox(height: 16),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class OrderDetailsItemCard extends StatefulWidget {
//   const OrderDetailsItemCard({
//     super.key,
//     required this.index,
//     required this.cartItem,
//   });
//
//   final int index;
//   final OrderItems cartItem;
//
//   @override
//   State<OrderDetailsItemCard> createState() => _OrderDetailsItemCardState();
// }
//
// class _OrderDetailsItemCardState extends State<OrderDetailsItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
//       child: Card(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF0F4F8),
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey[200]!, width: 1),
//                   ),
//                   child: CustomImage(
//                     url: widget.cartItem.imgCover ?? '',
//                     width: 40,
//                     height: 40,
//                   ),
//                 ),
//                 if (widget.cartItem.discount != 0)
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 2,
//                         horizontal: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: ColorManager.error.withAlpha(230),
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(10),
//                           bottomRight: Radius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'عرض خاص',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.white, fontSize: 8),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AutoSizeText(
//                     widget.cartItem.title ?? '',
//                     style: getSemiBoldStyle(
//                       color: ColorManager.black,
//                       fontSize: 12,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     children: [
//                       Text(
//                         widget.cartItem.discount != 0
//                             ? '${widget.cartItem.priceAfterDiscount?.toStringAsFixed(2)}'
//                             : '${widget.cartItem.price?.toStringAsFixed(2)}',
//                         style: getSemiBoldStyle(
//                           color: ColorManager.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                       RialIcon(color: ColorManager.black, size: 10),
//                       if (widget.cartItem.discount != 0) ...[
//                         Spacer(),
//                         Text(
//                           '${widget.cartItem.price?.toStringAsFixed(2)}',
//                           style: getSemiBoldStyle(
//                             color: ColorManager.error,
//                             fontSize: 12,
//                           ).copyWith(
//                             decoration: TextDecoration.lineThrough,
//                             decorationColor: ColorManager.error,
//                             decorationThickness: 2,
//                             height: 1.5,
//                           ),
//                         ),
//
//                         RialIcon(color: ColorManager.error, size: 10),
//                         Spacer(),
//                       ],
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 5),
//
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Column(
//                   children: [
//                     AutoSizeText(
//                       "الكمية",
//                       style: getBoldStyle(
//                         color: ColorManager.black,
//                         fontSize: 14,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8.0,
//                         vertical: 6.0,
//                       ),
//                       child: AutoSizeText(
//                         '${widget.cartItem.quantity}',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: ColorManager.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 5),
//
//                 Column(
//                   children: [
//                     AutoSizeText(
//                       "اجمالي",
//                       style: getBoldStyle(
//                         color: ColorManager.black,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8.0,
//                         vertical: 6.0,
//                       ),
//                       child: AutoSizeText(
//                         '${widget.cartItem.totalPrice?.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: ColorManager.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/core/resources/cashed_image.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
import 'package:delivery/core/widgets/rial_icon.dart';
import 'package:delivery/features/orders_completed/data/models/response/order_completed_dto.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});

  final OrdersCompleted order;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            // AppBar محسّن
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: ColorManager.indigoDark2,
              expandedHeight: 120,
              pinned: true,
              floating: false,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.indigoDark2,
                        ColorManager.indigoDark2.withOpacity(0.8),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green[300],
                              size: 28,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'طلب مكتمل',
                              style: getBoldStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  'تفاصيل الطلب',
                  style: getSemiBoldStyle(
                    color: ColorManager.white,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: ColorManager.indigoDark2,
                    ),
                  ),
                ),
              ),
            ),

            // معلومات رقم الطلب
            SliverToBoxAdapter(
              child: _buildOrderNumberCard(),
            ),

            // معلومات الطلب
            SliverToBoxAdapter(
              child: _buildOrderInfoSection(),
            ),

            // قائمة المنتجات
            if (order.orderItems != null && order.orderItems!.isNotEmpty)
              SliverToBoxAdapter(
                child: _buildProductsSection(),
              ),
            //
            // الملخص المالي
            SliverToBoxAdapter(
              child: _buildOrderSummary(),
            ),
            //
            // // مساحة إضافية في الأسفل
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderNumberCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.primaryColor.withOpacity(0.1),
            ColorManager.primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorManager.primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.receipt_long_rounded,
                color: ColorManager.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'رقم الطلب',
                style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.offWhite,
                        ColorManager.offWhite.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        order.user?.name ?? '',
                        style: getBoldStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        order.user?.phone ?? '',
                        style: getBoldStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.primaryColor,
                      ColorManager.primaryColor.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.primaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  order.orderNumber ?? '',
                  style: getBoldStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoItem(
              icon: Icons.calendar_today_rounded,
              label: 'تاريخ الطلب',
              value: order.updatedAt ?? '',
              color: ColorManager.indigoDark2,
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: Colors.grey[300],
          ),
          Expanded(
            child: _buildInfoItem(
              icon: Icons.shopping_bag_rounded,
              label: 'عدد المنتجات',
              value: '${order.orderItems?.length ?? 0}',
              color: ColorManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 28,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: getRegularStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: getBoldStyle(
            color: ColorManager.black,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProductsSection() {
    // فحص إذا كانت المنتجات متوفرة
    if (order.orderItems == null || order.orderItems!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.inventory_2_rounded,
                  color: ColorManager.primaryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'المنتجات المطلوبة',
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 2,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.primaryColor,
                  ColorManager.primaryColor.withOpacity(0.3),
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return OrderDetailsItemCard(
                index: index,
                cartItem: order.orderItems![index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: order.orderItems!.length,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orange,
            Colors.orange,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.receipt_rounded,
                color: Colors.orange[700],
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'ملخص الطلب',
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.payments_rounded,
                      color: ColorManager.primaryColor,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'المبلغ الإجمالي',
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      order.totalPrice?.toStringAsFixed(2) ?? '0',
                      style: getBoldStyle(
                        color: ColorManager.primaryColor,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 6),
                    RialIcon(
                      color: ColorManager.primaryColor,
                      size: 18,
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

class OrderDetailsItemCard extends StatefulWidget {
  const OrderDetailsItemCard({
    super.key,
    required this.index,
    required this.cartItem,
  });

  final int index;
  final OrderItems cartItem;

  @override
  State<OrderDetailsItemCard> createState() => _OrderDetailsItemCardState();
}

class _OrderDetailsItemCardState extends State<OrderDetailsItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(milliseconds: widget.index * 80), () {
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
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // صورة المنتج
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomImage(
                      url: widget.cartItem.imgCover ?? '',
                      width: 70,
                      height: 70,
                    ),
                  ),
                  if (widget.cartItem.discount != 0)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.red[700]!,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          '-${widget.cartItem.discount}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // معلومات المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.cartItem.title ?? '',
                    style: getSemiBoldStyle(
                      color: ColorManager.black,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // السعر
                  Row(
                    children: [
                      if (widget.cartItem.discount != 0) ...[
                        Text(
                          '${widget.cartItem.price?.toStringAsFixed(2)}',
                          style: getRegularStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ).copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6),
                      ],
                      Row(
                        children: [
                          Text(
                            widget.cartItem.discount != 0
                                ? '${widget.cartItem.priceAfterDiscount?.toStringAsFixed(2)}'
                                : '${widget.cartItem.price?.toStringAsFixed(2)}',
                            style: getBoldStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 3),
                          RialIcon(
                            color: ColorManager.primaryColor,
                            size: 11,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // الكمية والإجمالي
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                children: [
                  // الكمية
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.close,
                          size: 10,
                          color: ColorManager.primaryColor,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${widget.cartItem.quantity}',
                          style: getBoldStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // خط فاصل
                  Container(
                    width: 30,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 8),

                  // الإجمالي
                  Column(
                    children: [
                      Text(
                        'الإجمالي',
                        style: getRegularStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${widget.cartItem.totalPrice?.toStringAsFixed(2)}',
                            style: getBoldStyle(
                              color: ColorManager.blue,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 3),
                          RialIcon(
                            color: ColorManager.blue,
                            size: 11,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}