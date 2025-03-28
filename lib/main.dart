import 'package:flutter/material.dart';
import 'package:product_detail_application/app/app_providers/app_providers.dart';
import 'package:product_detail_application/app/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRoute,
      routes: AppRoutes.routes,
    );
  }
}
