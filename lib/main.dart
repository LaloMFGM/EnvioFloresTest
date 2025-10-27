import 'package:envioflorestest/config/router/app_routes.dart';
import 'package:envioflorestest/config/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Envio Florestest',
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
