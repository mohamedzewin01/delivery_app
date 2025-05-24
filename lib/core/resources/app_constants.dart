import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_view.dart';

class AppConstants {
  static const int listGenerate = 6;
  static const String version = 'v1.0.0';
  static const String collection = 'OrdersInfo';
  static const viewOptions = [

    HomeScreen(),
    Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('الادورات')
        ],
      ),

    ),
    Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('الحساب')
        ],
      ),

    ),

  ];
}
