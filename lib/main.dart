import 'package:envioflorestest/config/router/app_routes.dart';
import 'package:envioflorestest/config/theme/theme.dart';
import 'package:envioflorestest/domain/datasource/github_user_datasource.dart';
import 'package:envioflorestest/domain/infrastructure/datasource/github_users_datasource.dart';
import 'package:envioflorestest/presentation/providers/github_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GithubUserDatasource>(create: (_) => GithubUsersDatasource()),
        ChangeNotifierProvider<GithubUserProvider>(
          create: (context) {
            final datasource = context.read<GithubUserDatasource>();
            return GithubUserProvider(datasource: datasource);
          },
        ),
      ], 
        child: MaterialApp.router(
        title: 'Envio Flores Test',
        theme: AppTheme().getTheme(),
        routerConfig: appRouter,
    ));
  }
}
