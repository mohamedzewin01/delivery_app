import 'package:delivery/features/auth/presentation/pages/auth_screen.dart';
import 'package:delivery/features/order_details/presentation/pages/order_details_page.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/layout/presentation/pages/layout_view.dart';
import '../../splash.dart';

class RoutesManager {
  static const String splashScreen = '/';

  static const String homeScreen = '/home';
  static const String layout = '/layout';
  static const String categories = '/categories';
  static const String allBestDealsView = '/AllBestDeals';
  static const String bestDealsAdaptive = '/BestDealsAdaptive';
  static const String addressPage = '/AddressPage';
  static const String authScreen = '/AuthScreen';
  static const String orderDetails = '/orderDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case RoutesManager.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());


      case RoutesManager.authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
          settings: settings,
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("No Route Found")),
        body: const Center(child: Text("No Route Found")),
      ),
    );
  }
}
