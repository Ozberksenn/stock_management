import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:backofficestock/product/theme/theme.dart';
import 'package:backofficestock/view/check/check_provider.dart';
import 'package:backofficestock/view/company/company_provider.dart';
import 'package:backofficestock/view/form/form_provider.dart';
import 'package:backofficestock/view/home/home_proivder.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'product/routes/router.dart';
import 'product/storage/app_storage.dart';

void main() async {
  await Hive.initFlutter();
  try {
    await StorageService().init();
  } catch (e) {
    debugPrint("Hive Box Açılırken Hata: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProivder()),
        ChangeNotifierProvider(create: (context) => FormProvider()),
        ChangeNotifierProvider(create: (context) => CheckProvider()),
        ChangeNotifierProvider(create: (context) => CompanyProvider()),
        ChangeNotifierProvider(create: (context) => FormImagePickerProvider()),
      ],
      child: MaterialApp.router(
        title: 'Stock Management',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
