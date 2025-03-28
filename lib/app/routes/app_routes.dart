import 'package:product_detail_application/presentation/home_screen.dart';
import 'package:product_detail_application/presentation/login_screen.dart';
import 'package:product_detail_application/presentation/product_detail_screen.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String productDetailRoute = "/productDetail";
  static final routes = {
    loginRoute: (context) => const LoginScreen(),
    homeRoute: (context) => const HomeScreen(),
    productDetailRoute: (context) => const ProductDetailScreen(),
  };
}
