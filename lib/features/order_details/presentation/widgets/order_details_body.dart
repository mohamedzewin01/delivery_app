import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/assets_manager.dart';
import 'package:delivery/core/functions/launch_url.dart';
import 'package:delivery/core/resources/assets_manager.dart';
import 'package:delivery/core/resources/cashed_image.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
import 'package:delivery/core/widgets/rial_icon.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key, required this.order});

  final Orders? order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Text(
            'رقم الاوردر: ${order?.orderNumber}',
            style: getSemiBoldStyle(
              color: ColorManager.primaryColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            ' العميل: ${order?.user?.name}',
            style: getSemiBoldStyle(color: ColorManager.redLight, fontSize: 18),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: ColorManager.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ColorManager.primaryColor
                                      .withOpacity(0.15),
                                  // Lighter pink for store icon bg
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.carSvg,
                                          colorFilter: ColorFilter.mode(
                                            Colors.pink,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order?.user?.phone ?? '',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomShareInfoApp(
                            icon: Icons.call,
                            onTap: () async {
                              await CustomLaunchUrl.launchUrlCall(
                                numPhone: order?.user?.phone ?? '',
                              );
                            },
                            colorIcon: Colors.blueAccent,
                          ),
                          SizedBox(width: 12),
                          CustomShareInfoApp(
                            icon: FontAwesomeIcons.whatsapp,
                            onTap: () async {
                              await CustomLaunchUrl.launchUrlWhatsapp(
                                numPhone: order?.user?.phone ?? '',
                                name: '',
                              );
                            },
                            colorIcon: Colors.green,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: AutoSizeText(
                                order?.userAddress?.city ?? '',
                                textAlign: TextAlign.justify,
                                style: getSemiBoldStyle(
                                  color: ColorManager.indigoDark2,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4.0,
                                          ),
                                          child: Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: ColorManager.primaryColor,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: order?.userAddress?.street ?? '',
                                        style: getSemiBoldStyle(
                                          color: ColorManager.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                  softWrap: true,
                                  overflow: TextOverflow.visible,

                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4.0,
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.dotCircle,
                                            size: 12,
                                            color: ColorManager.primaryColor,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: order?.userAddress?.details ?? '',
                                        style: getSemiBoldStyle(
                                          color: ColorManager.primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'عدد المنتجات: ',
                        style: getSemiBoldStyle(
                          color: ColorManager.indigoDark2,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '${order?.orderItems?.length}',
                        style: getSemiBoldStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 14,
                        ), // أو لون مختلف
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  width: 80,
                  color: ColorManager.indigoDark2,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CartOrderItemCard(
                      index: index,
                      cartItem: order!.orderItems![index],
                    );
                  },
                  itemCount: order!.orderItems!.length,
                ),
                Column(
                  children: [
                    // Divider(color: Colors.grey.shade300),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'المبلغ قبل الخصم:',
                                  style: getSemiBoldStyle(
                                    color: ColorManager.lightTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                order?.totalPrice?.toStringAsFixed(2) ?? '',
                                style: getSemiBoldStyle(
                                  color: ColorManager.lightTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              RialIcon(
                                color: ColorManager.darkTextColor,
                                size: 14,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Divider(color: Colors.grey.shade300),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'السعر النهائي:',
                                  style: getSemiBoldStyle(
                                    color: ColorManager.lightTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                order?.totalPrice?.toStringAsFixed(2) ?? '',
                                style: TextStyle(
                                  color: ColorManager.darkTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RialIcon(),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
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

class CartOrderItemCard extends StatefulWidget {
  const CartOrderItemCard({
    super.key,
    required this.index,
    required this.cartItem,
  });

  final int index;
  final OrderItems cartItem;

  @override
  State<CartOrderItemCard> createState() => _CartOrderItemCardState();
}

class _CartOrderItemCardState extends State<CartOrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F4F8),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[200]!, width: 1),
                  ),
                  child: CustomImage(
                    url: widget.cartItem.imgCover ?? '',
                    width: 60,
                    height: 60,
                  ),
                ),
                if (widget.cartItem.discount != 0)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.error.withAlpha(230),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'عرض خاص',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    widget.cartItem.title ?? '',
                    style: getSemiBoldStyle(
                      color: ColorManager.black,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        widget.cartItem.priceAfterDiscount == 0
                            ? '${widget.cartItem.price?.toStringAsFixed(2)}'
                            : '${widget.cartItem.priceAfterDiscount?.toStringAsFixed(2)}',
                        style: getSemiBoldStyle(
                          color: ColorManager.black,
                          fontSize: 14,
                        ),
                      ),
                      RialIcon(color: ColorManager.black, size: 10),
                      if (widget.cartItem.discount != 0) ...[
                        Spacer(),
                        Text(
                          '${widget.cartItem.price?.toStringAsFixed(2)}',
                          style:
                              getSemiBoldStyle(
                                color: ColorManager.error,
                                fontSize: 12,
                              ).copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: ColorManager.error,
                                decorationThickness: 2,
                                height: 1.5,
                              ),
                        ),

                        RialIcon(color: ColorManager.error, size: 10),
                        Spacer(),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    AutoSizeText(
                      "الكمية",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.0,
                      ),
                      child: AutoSizeText(
                        '${widget.cartItem.quantity}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),

                Column(
                  children: [
                    AutoSizeText(
                      "اجمالي",
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.0,
                      ),
                      child: AutoSizeText(
                        '${widget.cartItem.totalPrice?.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
