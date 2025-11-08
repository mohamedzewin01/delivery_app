// // import 'package:delivery/core/di/di.dart';
// // import 'package:delivery/core/resources/color_manager.dart';
// // import 'package:delivery/core/resources/style_manager.dart';
// // import 'package:delivery/core/widgets/custom_app_bar.dart';
// // import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
// // import 'package:delivery/features/home/presentation/cubit/home_cubit.dart';
// // import 'package:delivery/features/home/presentation/widgets/order_card.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   late HomeCubit viewModel;
// //
// //   @override
// //   void initState() {
// //     viewModel = getIt.get<HomeCubit>();
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider.value(
// //       value: viewModel..getHomeData(),
// //       child: RefreshIndicator(
// //         onRefresh: () => viewModel.getHomeData(),
// //         child: Scaffold(
// //           appBar: CustomAppBar(
// //             icon: Icons.refresh,
// //             title: 'منارة أمجاد ',
// //             onBackTap: () {
// //               viewModel.getHomeData();
// //             },
// //           ),
// //           body: SafeArea(
// //             child: BlocBuilder<HomeCubit, HomeState>(
// //               builder: (context, state) {
// //                 if (state is HomeSuccess) {
// //                   List<Orders> orders =
// //                       state.homeEntity?.orders?.reversed.toList() ?? [];
// //                   return Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       // SizedBox(
// //                       //   height: 75,
// //                       //   child: CustomAppBar(title: 'منارة أمجاد '),
// //                       // ),
// //                       Expanded(
// //                         child: ListView.builder(
// //                           padding: const EdgeInsets.symmetric(
// //                             horizontal: 16.0,
// //                             vertical: 8.0,
// //                           ),
// //                           itemCount: orders.length,
// //                           itemBuilder: (context, index) {
// //                             return Padding(
// //                               padding: const EdgeInsets.only(bottom: 16.0),
// //                               child: OrderCard(
// //                                 order: orders[index],
// //                                 viewModel: viewModel,
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                       const SizedBox(height: kBottomNavigationBarHeight + 16),
// //                     ],
// //                   );
// //                 }
// //                 if (state is HomeFail) {
// //                   return Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       SizedBox(width: double.infinity),
// //                       Text(
// //                         'لا يوجد طلبات',
// //                         style: getSemiBoldStyle(
// //                           color: ColorManager.primaryColor,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8.0),
// //                       IconButton(
// //                         onPressed: () {
// //                           viewModel.getHomeData();
// //                         },
// //                         icon: Icon(
// //                           Icons.refresh,
// //                           color: ColorManager.primaryColor,
// //                         ),
// //                       ),
// //                     ],
// //                   );
// //                 }
// //                 return Center(
// //                   child: CircularProgressIndicator(
// //                     color: ColorManager.primaryColor,
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'dart:async';
// import 'package:delivery/core/di/di.dart';
// import 'package:delivery/core/resources/color_manager.dart';
// import 'package:delivery/core/resources/style_manager.dart';
// import 'package:delivery/core/widgets/custom_app_bar.dart';
// import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
// import 'package:delivery/features/home/presentation/cubit/home_cubit.dart';
// import 'package:delivery/features/home/presentation/widgets/order_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
//   late HomeCubit viewModel;
//   Timer? _autoRefreshTimer;
//   DateTime? _lastUpdateTime;
//   bool _isAutoRefreshing = false;
//   late AnimationController _pulseController;
//   late Animation<double> _pulseAnimation;
//
//   @override
//   void initState() {
//     viewModel = getIt.get<HomeCubit>();
//     _setupAutoRefresh();
//
//     // إعداد الرسوم المتحركة للمؤشر
//     _pulseController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );
//
//     super.initState();
//   }
//
//   void _setupAutoRefresh() {
//     // جلب البيانات أول مرة
//     _refreshData();
//
//     // إعداد التحديث التلقائي كل 30 ثانية
//     _autoRefreshTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
//       _refreshData();
//     });
//   }
//
//   Future<void> _refreshData() async {
//     if (!mounted) return;
//
//     setState(() {
//       _isAutoRefreshing = true;
//       _lastUpdateTime = DateTime.now();
//     });
//
//     await viewModel.getHomeData();
//
//     if (mounted) {
//       setState(() {
//         _isAutoRefreshing = false;
//       });
//     }
//   }
//
//   String _getTimeAgo() {
//     if (_lastUpdateTime == null) return 'جاري التحميل...';
//
//     final difference = DateTime.now().difference(_lastUpdateTime!);
//     if (difference.inSeconds < 60) {
//       return 'الآن';
//     } else if (difference.inMinutes < 2) {
//       return 'منذ دقيقة';
//     } else if (difference.inMinutes < 10) {
//       return 'منذ ${difference.inMinutes} دقائق';
//     } else {
//       return DateFormat('hh:mm a', 'ar').format(_lastUpdateTime!);
//     }
//   }
//
//   @override
//   void dispose() {
//     _autoRefreshTimer?.cancel();
//     _pulseController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: viewModel,
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 ColorManager.primaryColor.withOpacity(0.05),
//                 Colors.white,
//               ],
//             ),
//           ),
//           child: RefreshIndicator(
//             onRefresh: _refreshData,
//             color: ColorManager.primaryColor,
//             child: CustomScrollView(
//               slivers: [
//                 // AppBar مخصص مع التدرج اللوني
//                 SliverAppBar(
//                   expandedHeight: 160,
//                   floating: false,
//                   pinned: true,
//                   backgroundColor: ColorManager.primaryColor,
//                   flexibleSpace: FlexibleSpaceBar(
//                     background: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomLeft,
//                           colors: [
//                             ColorManager.primaryColor,
//                             ColorManager.primaryColor.withOpacity(0.8),
//                           ],
//                         ),
//                       ),
//                       child: SafeArea(
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     child: const Icon(
//                                       Icons.delivery_dining,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 15),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'منارة أمجاد',
//                                           style: getBoldStyle(
//                                             color: Colors.white,
//                                             fontSize: 24,
//                                           ),
//                                         ),
//                                         Text(
//                                           'إدارة الطلبات',
//                                           style: getRegularStyle(
//                                             color: Colors.white.withOpacity(0.9),
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   // مؤشر التحديث التلقائي
//                                   AnimatedBuilder(
//                                     animation: _pulseAnimation,
//                                     builder: (context, child) {
//                                       return Transform.scale(
//                                         scale: _isAutoRefreshing ? _pulseAnimation.value : 1.0,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(8),
//                                           decoration: BoxDecoration(
//                                             color: Colors.white.withOpacity(_isAutoRefreshing ? 0.3 : 0.2),
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                           child: _isAutoRefreshing
//                                               ? const SizedBox(
//                                             width: 20,
//                                             height: 20,
//                                             child: CircularProgressIndicator(
//                                               strokeWidth: 2,
//                                               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                                             ),
//                                           )
//                                               : const Icon(
//                                             Icons.sync,
//                                             color: Colors.white,
//                                             size: 20,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 10),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.access_time_rounded,
//                                     color: Colors.white.withOpacity(0.8),
//                                     size: 14,
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     'آخر تحديث: ${_getTimeAgo()}',
//                                     style: getRegularStyle(
//                                       color: Colors.white.withOpacity(0.9),
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 15),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                                     decoration: BoxDecoration(
//                                       color: Colors.white.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.autorenew,
//                                           color: Colors.white.withOpacity(0.9),
//                                           size: 14,
//                                         ),
//                                         const SizedBox(width: 5),
//                                         Text(
//                                           'تلقائي 30 ثانية',
//                                           style: getRegularStyle(
//                                             color: Colors.white.withOpacity(0.9),
//                                             fontSize: 11,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // محتوى الطلبات
//                 BlocBuilder<HomeCubit, HomeState>(
//                   builder: (context, state) {
//                     if (state is HomeSuccess) {
//                       List<Orders> orders = state.homeEntity?.orders?.reversed.toList() ?? [];
//
//                       if (orders.isEmpty) {
//                         return SliverFillRemaining(
//                           child: _buildEmptyState(),
//                         );
//                       }
//
//                       int pendingOrders = orders.where((o) => o.status == 'Pending').length;
//                       int inProgressOrders = orders.where((o) =>
//                       o.status == 'Order Accepted' ||
//                           o.status == 'Preparing' ||
//                           o.status == 'Out for Delivery'
//                       ).length;
//                       int completedOrders = orders.where((o) => o.status == 'Delivered').length;
//
//
//
//                       return SliverList(
//                         delegate: SliverChildListDelegate([
//                           // بطاقة الإحصائيات
//                           _buildStatsCard(
//                             context,
//                             total: orders.length,
//                             pending: pendingOrders,
//                             inProgress: inProgressOrders,
//                             completed: completedOrders,
//                           ),
//
//                           // عنوان القائمة
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'الطلبات الحالية',
//                                   style: getBoldStyle(
//                                     color: ColorManager.black,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: ColorManager.primaryColor.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Text(
//                                     '${orders.length} طلب',
//                                     style: getSemiBoldStyle(
//                                       color: ColorManager.primaryColor,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           // قائمة الطلبات المحسنة
//                           ...orders.map((order) => ImprovedOrderCard(
//                             order: order,
//                             viewModel: viewModel,
//                           )).toList(),
//
//                           const SizedBox(height: 100),
//                         ]),
//                       );
//                     } else if (state is HomeLoading) {
//                       return SliverFillRemaining(
//                         child: _buildLoadingState(),
//                       );
//                     } else if (state is HomeFail) {
//                       return SliverFillRemaining(
//                         child: _buildErrorState(state.exception.toString() ?? 'حدث خطأ'),
//                       );
//                     }
//
//                     return const SliverFillRemaining(
//                       child: Center(child: CircularProgressIndicator()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatsCard(
//       BuildContext context, {
//         required int total,
//         required int pending,
//         required int inProgress,
//         required int completed,
//       }) {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: ColorManager.primaryColor.withOpacity(0.1),
//             blurRadius: 20,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.analytics_outlined,
//                 color: ColorManager.primaryColor,
//                 size: 24,
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 'إحصائيات سريعة',
//                 style: getBoldStyle(
//                   color: ColorManager.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: _buildStatItem(
//                   icon: Icons.pending_actions,
//                   label: 'قيد الانتظار',
//                   value: pending.toString(),
//                   color: Colors.orange,
//                 ),
//               ),
//               Expanded(
//                 child: _buildStatItem(
//                   icon: Icons.local_shipping,
//                   label: 'جاري التوصيل',
//                   value: inProgress.toString(),
//                   color: Colors.blue,
//                 ),
//               ),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatItem({
//     required IconData icon,
//     required String label,
//     required String value,
//     required Color color,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 28),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: getBoldStyle(
//               color: color,
//               fontSize: 24,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: getRegularStyle(
//               color: ColorManager.grey,
//               fontSize: 11,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLoadingState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(
//             color: ColorManager.primaryColor,
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'جاري تحميل الطلبات...',
//             style: getSemiBoldStyle(
//               color: ColorManager.grey,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.inbox_outlined,
//             size: 100,
//             color: ColorManager.grey.withOpacity(0.5),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'لا توجد طلبات حالياً',
//             style: getBoldStyle(
//               color: ColorManager.black,
//               fontSize: 20,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             'سيتم تحديث الطلبات تلقائياً كل 30 ثانية',
//             textAlign: TextAlign.center,
//             style: getRegularStyle(
//               color: ColorManager.grey,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildErrorState(String message) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.error_outline,
//             size: 80,
//             color: Colors.red.withOpacity(0.7),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'لا يوجد طلبات حاليا',
//             style: getBoldStyle(
//               color: ColorManager.black,
//               fontSize: 20,
//             ),
//           ),
//           // const SizedBox(height: 10),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 40),
//           //   child: Text(
//           //     message,
//           //     textAlign: TextAlign.center,
//           //     style: getRegularStyle(
//           //       color: ColorManager.grey,
//           //       fontSize: 14,
//           //     ),
//           //   ),
//           // ),
//           const SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: _refreshData,
//             icon: const Icon(Icons.refresh),
//             label: const Text('تحديث الصفحة'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: ColorManager.primaryColor,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:delivery/core/di/di.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/routes_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
import 'package:delivery/core/utils/cashed_data_shared_preferences.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:delivery/features/home/presentation/cubit/home_cubit.dart';
import 'package:delivery/features/home/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:audioplayers/audioplayers.dart'; // إضافة المكتبة

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeCubit viewModel;
  Timer? _autoRefreshTimer;
  DateTime? _lastUpdateTime;
  bool _isAutoRefreshing = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  // إضافة متغيرات للصوت
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _previousOrdersCount;
  List<String> _previousOrderIds = [];

  @override
  void initState() {
    viewModel = getIt.get<HomeCubit>();
    _setupAutoRefresh();

    // إعداد الرسوم المتحركة للمؤشر
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    super.initState();
  }

  void _setupAutoRefresh() {
    // جلب البيانات أول مرة
    _refreshData();

    // إعداد التحديث التلقائي كل 30 ثانية
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _refreshData();
    });
  }

  Future<void> _refreshData() async {
    if (!mounted) return;

    setState(() {
      _isAutoRefreshing = true;
      _lastUpdateTime = DateTime.now();
    });

    await viewModel.getHomeData();

    if (mounted) {
      setState(() {
        _isAutoRefreshing = false;
      });
    }
  }

  // دالة للتحقق من الطلبات الجديدة وتشغيل الصوت
  Future<void> _checkForNewOrders(List<Orders> currentOrders) async {
    if (_previousOrderIds.isEmpty) {
      // أول مرة - حفظ الطلبات الحالية فقط
      _previousOrderIds = currentOrders
          .map((o) => o.idOrder.toString() ?? '')
          .toList();
      return;
    }

    // البحث عن طلبات جديدة
    List<String> currentOrderIds = currentOrders
        .map((o) => o.idOrder.toString() ?? '')
        .toList();
    List<String> newOrderIds = currentOrderIds
        .where((id) => !_previousOrderIds.contains(id))
        .toList();

    if (newOrderIds.isNotEmpty) {
      // يوجد طلب جديد - تشغيل الصوت
      await _playNotificationSound();

      // إظهار رسالة تنبيه
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.notifications_active, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  'لديك ${newOrderIds.length} طلب جديد!',
                  style: getBoldStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            backgroundColor: ColorManager.primaryColor,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }

    // تحديث القائمة السابقة
    _previousOrderIds = currentOrderIds;
  }

  // دالة تشغيل الصوت
  Future<void> _playNotificationSound() async {
    try {
      // تشغيل من ملف محلي
      await _audioPlayer.play(AssetSource('sounds/notification1.wav'));

      // أو استخدام صوت النظام (بديل)
      await _audioPlayer.play(
        AssetSource('sounds/notification1.wav'),
        mode: PlayerMode.lowLatency,
      );
    } catch (e) {
      print('خطأ في تشغيل الصوت: $e');
    }
  }

  String _getTimeAgo() {
    if (_lastUpdateTime == null) return 'جاري التحميل...';

    final difference = DateTime.now().difference(_lastUpdateTime!);
    if (difference.inSeconds < 60) {
      return 'الآن';
    } else if (difference.inMinutes < 2) {
      return 'منذ دقيقة';
    } else if (difference.inMinutes < 10) {
      return 'منذ ${difference.inMinutes} دقائق';
    } else {
      return DateFormat('hh:mm a', 'ar').format(_lastUpdateTime!);
    }
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    _pulseController.dispose();
    _audioPlayer.dispose(); // تنظيف مشغل الصوت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.primaryColor.withOpacity(0.05),
                Colors.white,
              ],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: _refreshData,
            color: ColorManager.primaryColor,
            child: CustomScrollView(
              slivers: [
                // AppBar مخصص مع التدرج اللوني
                SliverAppBar(
                  expandedHeight: 160,
                  floating: false,
                  pinned: true,
                  backgroundColor: ColorManager.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            ColorManager.primaryColor,
                            ColorManager.primaryColor.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      Icons.delivery_dining,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'منارة أمجاد',
                                          style: getBoldStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text(
                                          'إدارة الطلبات',
                                          style: getRegularStyle(
                                            color: Colors.white.withOpacity(
                                              0.9,
                                            ),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // مؤشر التحديث التلقائي
                                  AnimatedBuilder(
                                    animation: _pulseAnimation,
                                    builder: (context, child) {
                                      return Transform.scale(
                                        scale: _isAutoRefreshing
                                            ? _pulseAnimation.value
                                            : 1.0,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(
                                              _isAutoRefreshing ? 0.3 : 0.2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: _isAutoRefreshing
                                              ? const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                          Color
                                                        >(Colors.white),
                                                  ),
                                                )
                                              : const Icon(
                                                Icons.sync,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  // Icon(
                                  //   Icons.access_time_rounded,
                                  //   color: Colors.white.withOpacity(0.8),
                                  //   size: 14,
                                  // ),
                                  // const SizedBox(width: 5),
                                  // Text(
                                  //   'آخر تحديث: ${_getTimeAgo()}',
                                  //   style: getRegularStyle(
                                  //     color: Colors.white.withOpacity(0.9),
                                  //     fontSize: 12,
                                  //   ),
                                  // ),
                                  const SizedBox(width: 15),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.autorenew,
                                          color: Colors.white.withOpacity(0.9),
                                          size: 14,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'تلقائي 30 ثانية',
                                          style: getRegularStyle(
                                            color: Colors.white.withOpacity(
                                              0.9,
                                            ),
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: const SizedBox(width: 15)),
                                  Container(
                                    // padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(
                                        _isAutoRefreshing ? 0.3 : 0.2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.exit_to_app,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        CacheService.clearItems();
                                        Navigator.pushReplacementNamed(context,RoutesManager.splashScreen );
                                      },
                                    ),
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

                // محتوى الطلبات
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSuccess) {
                      List<Orders> orders =
                          state.homeEntity?.orders?.reversed.toList() ?? [];

                      // التحقق من الطلبات الجديدة
                      _checkForNewOrders(orders);

                      if (orders.isEmpty) {
                        return SliverFillRemaining(child: _buildEmptyState());
                      }

                      int pendingOrders = orders
                          .where((o) => o.status == 'Pending')
                          .length;
                      int inProgressOrders = orders
                          .where(
                            (o) =>
                                o.status == 'Order Accepted' ||
                                o.status == 'Preparing' ||
                                o.status == 'Out for Delivery',
                          )
                          .length;
                      int completedOrders = orders
                          .where((o) => o.status == 'Delivered')
                          .length;

                      return SliverList(
                        delegate: SliverChildListDelegate([
                          // بطاقة الإحصائيات
                          _buildStatsCard(
                            context,
                            total: orders.length,
                            pending: pendingOrders,
                            inProgress: inProgressOrders,
                            completed: completedOrders,
                          ),

                          // عنوان القائمة
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الطلبات الحالية',
                                  style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorManager.primaryColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${orders.length} طلب',
                                    style: getSemiBoldStyle(
                                      color: ColorManager.primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // قائمة الطلبات المحسنة
                          ...orders
                              .map(
                                (order) => ImprovedOrderCard(
                                  order: order,
                                  viewModel: viewModel,
                                ),
                              )
                              .toList(),

                          const SizedBox(height: 100),
                        ]),
                      );
                    } else if (state is HomeLoading) {
                      return SliverFillRemaining(child: _buildLoadingState());
                    } else if (state is HomeFail) {
                      return SliverFillRemaining(
                        child: _buildErrorState(
                          state.exception.toString() ?? 'حدث خطأ',
                        ),
                      );
                    }

                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsCard(
    BuildContext context, {
    required int total,
    required int pending,
    required int inProgress,
    required int completed,
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primaryColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: ColorManager.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'إحصائيات سريعة',
                style: getBoldStyle(color: ColorManager.black, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.pending_actions,
                  label: 'قيد الانتظار',
                  value: pending.toString(),
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.local_shipping,
                  label: 'جاري التوصيل',
                  value: inProgress.toString(),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(value, style: getBoldStyle(color: color, fontSize: 24)),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: getRegularStyle(color: ColorManager.grey, fontSize: 11),
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
          CircularProgressIndicator(color: ColorManager.primaryColor),
          const SizedBox(height: 20),
          Text(
            'جاري تحميل الطلبات...',
            style: getSemiBoldStyle(color: ColorManager.grey, fontSize: 16),
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
          Icon(
            Icons.inbox_outlined,
            size: 100,
            color: ColorManager.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 20),
          Text(
            'لا توجد طلبات حالياً',
            style: getBoldStyle(color: ColorManager.black, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'سيتم تحديث الطلبات تلقائياً كل 30 ثانية',
            textAlign: TextAlign.center,
            style: getRegularStyle(color: ColorManager.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red.withOpacity(0.7),
          ),
          const SizedBox(height: 20),
          Text(
            'لا يوجد طلبات حاليا',
            style: getBoldStyle(color: ColorManager.black, fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _refreshData,
            icon: const Icon(Icons.refresh),
            label: const Text('تحديث الصفحة'),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
