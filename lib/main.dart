import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/auth_controller.dart';
import 'package:getx_flutter_demo/locale/locale.dart';
import 'package:getx_flutter_demo/locale/locale_controller.dart';
import 'package:getx_flutter_demo/middleware/auth_midware.dart';
import 'package:getx_flutter_demo/services/settings_services.dart';
import 'package:getx_flutter_demo/utils/binding.dart';
import 'package:getx_flutter_demo/view/home.dart';
import 'package:getx_flutter_demo/view/screen_one.dart';
import 'package:getx_flutter_demo/view/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<AuthController>(() async {
    return AuthController(await SharedPreferences.getInstance());
  });
  await initialServices();
  Get.put(MyLocaleController());
  runApp(const MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingsService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      locale: Get.deviceLocale,
      translations: MyLocale(),
      initialBinding: MyBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/screen-one',
          page: () => ScreenOne(),
          binding: MyBinding(),
        ),
        GetPage(name: '/screen-two', page: () => ScreenTwo()),
      ],
    );
  }
}
