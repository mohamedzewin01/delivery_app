
import 'package:auto_size_text/auto_size_text.dart';
import 'package:delivery/core/functions/launch_url.dart';
import 'package:delivery/core/resources/assets_manager.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
import 'package:delivery/core/widgets/rial_icon.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderCard extends StatelessWidget {
  final Orders order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 2.0,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey.withAlpha(150), width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
        color: ColorManager.primaryColor.withAlpha(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: order.orderNumber ?? '',
                    style: getSemiBoldStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.person, color: ColorManager.primaryColor),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    order.user?.name ?? '',

                    style: getSemiBoldStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.user?.phone ?? '',
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
                            numPhone: order.user?.phone ?? '',
                          );
                        },
                        colorIcon: Colors.blueAccent,
                      ),
                      SizedBox(width: 12),
                      CustomShareInfoApp(
                        icon: FontAwesomeIcons.whatsapp,
                        onTap: () async {
                          await CustomLaunchUrl.launchUrlWhatsapp(
                            numPhone: order.user?.phone ?? '',
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
                            order.userAddress?.city ?? '',
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
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: ColorManager.primaryColor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: order.userAddress?.street ?? '',
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
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Icon(
                                        FontAwesomeIcons.dotCircle,
                                        size: 12,
                                        color: ColorManager.primaryColor,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: order.userAddress?.details ?? '',
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
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Icon(
                            Icons.production_quantity_limits_outlined,
                            size: 12,
                            color: ColorManager.grey,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'عدد المنتجات : ',

                        style: getSemiBoldStyle(
                          color: ColorManager.grey,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: order.orderItems?.length.toString() ?? '',
                        style: getSemiBoldStyle(
                          color: ColorManager.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorManager.primaryColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    order.totalPrice.toString(),
                    textAlign: TextAlign.center,
                    style: getSemiBoldStyle(
                      color: ColorManager.white,
                      fontSize: 18,
                    ).copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 4),
                  RialIcon(size: 18, color: ColorManager.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}