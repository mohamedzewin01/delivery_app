// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:delivery/assets_manager.dart';
// import 'package:delivery/core/functions/launch_url.dart';
// import 'package:delivery/core/functions/translate_order_status.dart';
// import 'package:delivery/core/resources/assets_manager.dart';
// import 'package:delivery/core/resources/color_manager.dart';
// import 'package:delivery/core/resources/routes_manager.dart';
// import 'package:delivery/core/resources/style_manager.dart';
// import 'package:delivery/core/utils/firebase_utils.dart';
// import 'package:delivery/core/widgets/custom_dialog.dart';
// import 'package:delivery/core/widgets/rial_icon.dart';
// import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
// import 'package:delivery/features/order_details/presentation/pages/order_details_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../cubit/home_cubit.dart';
//
// class OrderCard extends StatelessWidget {
//   final Orders order;
//   final HomeCubit viewModel;
//
//   const OrderCard({super.key, required this.order, required this.viewModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         // 1. عرض مؤشر التحميل
//         showDialog(
//           context: context,
//           barrierDismissible: false, // يمنع الإغلاق بالنقر بالخارج
//           builder: (context) =>
//                Center(child: CircularProgressIndicator(color: ColorManager.primaryColor)),
//         );
//
//         try {
//
//           await FirebaseUtils.addOrder(order.toOrdersFirebaseModel());
//
//           int currentStageIndex = getCurrentStageIndex(order.status ?? '');
//
//           if (context.mounted) {
//             Navigator.pop(context);
//
//
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => OrderDetailsPage(
//                   order: order,
//                   orderId: order.idOrder.toString(),
//                   currentStageIndex: currentStageIndex,
//                 ),
//               ),
//             ).then((value) {
//               viewModel.getHomeData();
//             });
//           }
//         } catch (e) {
//           if (context.mounted) {
//             Navigator.pop(context);
//
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: const Text('حدث خطأ'),
//                 content: Text(e.toString()),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('حسناً'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         }
//       },
//       child: Container(
//         // elevation: 2.0,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: ColorManager.grey.withAlpha(150),
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.circular(12.0),
//           color: ColorManager.primaryColor.withAlpha(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: Border.all(color: ColorManager.grey),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset: const Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: AutoSizeText(
//                         translateOrderStatus(order.status ?? ''),
//                         style: getSemiBoldStyle(
//                           color: ColorManager.primaryColor,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: order.orderNumber ?? '',
//                           style: getSemiBoldStyle(
//                             color: ColorManager.primaryColor,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   Icon(Icons.person, color: ColorManager.primaryColor),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       order.user?.name ?? '',
//
//                       style: getSemiBoldStyle(
//                         color: ColorManager.primaryColor,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 padding: const EdgeInsets.all(12.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(color: ColorManager.grey),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(0, 1),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 radius: 20,
//
//                                 backgroundColor: ColorManager.primaryColor
//                                     .withOpacity(0.15),
//                                 // Lighter pink for store icon bg
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4.0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         Assets.carSvg,
//                                         colorFilter: ColorFilter.mode(
//                                           Colors.pink,
//                                           BlendMode.srcIn,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       order.user?.phone ?? '',
//                                       textDirection: TextDirection.ltr,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 2),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         CustomShareInfoApp(
//                           icon: Icons.call,
//                           onTap: () async {
//                             await CustomLaunchUrl.launchUrlCall(
//                               numPhone: order.user?.phone ?? '',
//                             );
//                           },
//                           colorIcon: Colors.blueAccent,
//                         ),
//                         SizedBox(width: 12),
//                         CustomShareInfoApp(
//                           icon: FontAwesomeIcons.whatsapp,
//                           onTap: () async {
//                             await CustomLaunchUrl.launchUrlWhatsapp(
//                               numPhone: order.user?.phone ?? '',
//                               name: '',
//                             );
//                           },
//                           colorIcon: Colors.green,
//                         ),
//                         SizedBox(width: 12),
//                         CustomShareInfoApp(
//                           icon: FontAwesomeIcons.locationCrosshairs,
//                           onTap: () async {
//                             order.userAddress?.lat != null &&
//                                     order.userAddress?.long != null
//                                 ? CustomLaunchUrl.openMap(
//                                     lat: double.parse(
//                                       order.userAddress?.lat ?? '0.0',
//                                     ),
//                                     long: double.parse(
//                                       order.userAddress?.long ?? '0.0',
//                                     ),
//                                   )
//                                 : CustomDialog.showErrorDialog(
//                                     context,
//                                     message: 'لا يوجد موقع للمستخدم',
//                                   );
//                           },
//                           colorIcon: Colors.pinkAccent,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: 60,
//                           child: FittedBox(
//                             fit: BoxFit.scaleDown,
//                             child: AutoSizeText(
//                               order.userAddress?.city ?? '',
//                               textAlign: TextAlign.justify,
//                               style: getSemiBoldStyle(
//                                 color: ColorManager.indigoDark2,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                           left: 4.0,
//                                         ),
//                                         child: Icon(
//                                           Icons.location_on,
//                                           size: 16,
//                                           color: ColorManager.primaryColor,
//                                         ),
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: order.userAddress?.street ?? '',
//                                       style: getSemiBoldStyle(
//                                         color: ColorManager.primaryColor,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               RichText(
//                                 softWrap: true,
//                                 overflow: TextOverflow.visible,
//
//                                 text: TextSpan(
//                                   children: [
//                                     WidgetSpan(
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                           left: 4.0,
//                                         ),
//                                         child: Icon(
//                                           FontAwesomeIcons.dotCircle,
//                                           size: 12,
//                                           color: ColorManager.primaryColor,
//                                         ),
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: order.userAddress?.details ?? '',
//                                       style: getSemiBoldStyle(
//                                         color: ColorManager.primaryColor,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         WidgetSpan(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 4.0),
//                             child: Icon(
//                               Icons.production_quantity_limits_outlined,
//                               size: 12,
//                               color: ColorManager.grey,
//                             ),
//                           ),
//                         ),
//                         TextSpan(
//                           text: 'عدد المنتجات : ',
//
//                           style: getSemiBoldStyle(
//                             color: ColorManager.grey,
//                             fontSize: 12,
//                           ),
//                         ),
//                         TextSpan(
//                           text: order.orderItems?.length.toString() ?? '',
//                           style: getSemiBoldStyle(
//                             color: ColorManager.grey,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: ColorManager.primaryColor,
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           order.totalPrice.toString(),
//                           textAlign: TextAlign.center,
//                           style: getSemiBoldStyle(
//                             color: ColorManager.white,
//                             fontSize: 18,
//                           ).copyWith(fontWeight: FontWeight.w800),
//                         ),
//                         const SizedBox(width: 4),
//                         RialIcon(size: 18, color: ColorManager.white),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:delivery/core/functions/launch_url.dart';
import 'package:delivery/core/functions/translate_order_status.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/routes_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
import 'package:delivery/core/utils/firebase_utils.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:delivery/features/home/presentation/cubit/home_cubit.dart';
import 'package:delivery/features/order_details/presentation/pages/order_details_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImprovedOrderCard extends StatelessWidget {
  final Orders order;
  final HomeCubit viewModel;

  const ImprovedOrderCard({
    super.key,
    required this.order,
    required this.viewModel,
  });

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'in_progress':
      case 'in progress':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return Icons.pending_actions;
      case 'in_progress':
      case 'in progress':
        return Icons.local_shipping;
      case 'completed':
        return Icons.check_circle;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    // إزالة أي رموز أو مسافات من رقم الهاتف
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    // إضافة كود الدولة إذا لم يكن موجوداً
    if (!cleanNumber.startsWith('+')) {
      cleanNumber = '+966$cleanNumber'; // كود السعودية
    }

    final Uri whatsappUri = Uri.parse('https://wa.me/$cleanNumber');

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openLocation(double? latitude, double? longitude) async {
    if (latitude == null || longitude == null) {
      return;
    }

    // استخدام Google Maps
    final Uri mapsUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);
    final statusIcon = _getStatusIcon(order.status);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: statusColor.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () async {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(color: ColorManager.primaryColor),
              ),
            );

            try {
              await FirebaseUtils.addOrder(order.toOrdersFirebaseModel());
              int currentStageIndex = getCurrentStageIndex(order.status ?? '');

              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsPage(
                    orderId: order.idOrder.toString(),
                    currentStageIndex: currentStageIndex,
                    order: order,
                  ),
                ),
              );
            } catch (e) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('حدث خطأ: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الصف الأول: رقم الطلب والحالة
                Row(
                  children: [
                    // أيقونة الطلب
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            statusColor,
                            statusColor.withOpacity(0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        statusIcon,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // معلومات الطلب
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'طلب #${order.orderNumber ?? 'غير متوفر'}',
                            style: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: statusColor.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  statusIcon,
                                  color: statusColor,
                                  size: 14,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  translateOrderStatus(order.status ?? 'unknown'),
                                  style: getSemiBoldStyle(
                                    color: statusColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // أيقونة السهم
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.primaryColor,
                        size: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // معلومات العميل
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: ColorManager.primaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'العميل:',
                            style: getSemiBoldStyle(
                              color: ColorManager.grey,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              order.user?.name ?? 'غير متوفر',
                              style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (order.user?.phone != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: ColorManager.primaryColor,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'الهاتف:',
                              style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                order.user?.phone ?? '',
                                style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: 14,
                                ),
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // تفاصيل الطلب السريعة
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoChip(
                        icon: Icons.shopping_bag_outlined,
                        label: '${order.orderItems?.length ?? 0} منتج',
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildInfoChip(
                        icon: Icons.attach_money,
                        label: '${order.totalPrice ?? 0} ر.س',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // أزرار الإجراءات
                Row(
                  children: [
                    // زر الاتصال
                    if (order.user?.phone != null)
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.phone,
                          label: 'اتصال',
                          color: Colors.blue,
                          onTap: () => _makePhoneCall(order.user!.phone!),
                        ),
                      ),

                    if (order.user?.phone != null) const SizedBox(width: 8),

                    // زر واتساب
                    if (order.user?.phone != null)
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.chat,
                          label: 'واتساب',
                          color: const Color(0xFF25D366),
                          onTap: () => _openWhatsApp(order.user!.phone!),
                        ),
                      ),

                    const SizedBox(width: 8),

                    // زر الموقع
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.location_on,
                        label: 'الموقع',
                        color: Colors.red,
                        onTap: () {
                          // يمكنك استخدام موقع العميل من الطلب
                          // هنا مثال، قم بتعديله حسب البيانات المتوفرة
                          final lat = double.parse(order.userAddress?.lat??'');
                          final lng = double.parse(order.userAddress?.long??'');
                          if (lat != null && lng != null) {
                            _openLocation(lat, lng);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('الموقع غير متوفر'),
                                backgroundColor: Colors.orange,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),

                // الوقت
                if (order.createdAt != null) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: ColorManager.grey,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        order.createdAt ?? '',
                        style: getRegularStyle(
                          color: ColorManager.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: getSemiBoldStyle(
                color: color,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                label,
                style: getSemiBoldStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
int getCurrentStageIndex(String status) {
  switch (status) {
    case 'Pending':
      return 0;
    case 'Order Accepted':
      return 1;
    case 'Preparing':
      return 2;
    case 'Out for Delivery':
      return 3;
    case 'Delivered':
      return 4;
    default:
      return 0;
  }
}
///'Pending','Order Accepted','Preparing','Out for Delivery','Delivered'