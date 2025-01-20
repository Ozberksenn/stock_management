import 'package:backofficestock/product/theme/theme.dart';
import 'package:backofficestock/view/form/form_provider.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product/routes/router.dart';
import 'view/stock/stock_provider.dart';

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
        ChangeNotifierProvider(create: (context) => HomeProivder()),
        ChangeNotifierProvider(create: (context) => FormProvider()),
      ],
      child: MaterialApp.router(
        title: 'Stock Management',
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
