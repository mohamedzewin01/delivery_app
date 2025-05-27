import 'package:delivery/features/orders_completed/presentation/pages/orders_completed_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_view.dart';

class AppConstants {
  static const int listGenerate = 6;
  static const String version = 'v1.0.0';
  static const String collection = 'OrdersInfo';
  static const viewOptions = [

    HomeScreen(),
    OrdersCompletedPage(),


  ];
}
