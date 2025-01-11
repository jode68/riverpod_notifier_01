import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:template68/routes/routes.dart';
import 'package:template68/utils/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.appTheme(true),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homePage,
      getPages: Routes.routes,
    );
  }
}
