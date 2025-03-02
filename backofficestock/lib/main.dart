import 'package:backofficestock/product/editors/form_image_picker_field.dart';
import 'package:backofficestock/product/theme/theme.dart';
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
    await StorageService().init(); // Singleton üzerinden çağır
  } catch (e) {
    debugPrint("Hive Box Açılırken Hata: $e");
  }
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
        ChangeNotifierProvider(create: (context) => FormImagePickerProvider()),
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
