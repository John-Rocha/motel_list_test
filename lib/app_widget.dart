import 'package:flutter/material.dart';
import 'package:motel_list_test/core/route/app_routes.dart';
import 'package:motel_list_test/core/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Guia de Motéis',
      theme: AppTheme.light,
      routerConfig: AppRoutes.router,
    );
  }
}
