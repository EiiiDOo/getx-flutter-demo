import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/auth_controller.dart';
import 'package:getx_flutter_demo/locale/locale_controller.dart';
import 'package:getx_flutter_demo/services/settings_services.dart';

class HomeScreen extends GetView<SettingsService> {
  HomeScreen({super.key});
  final MyLocaleController myLocaleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            MaterialButton(
              onPressed:
                  () =>
                      Get.toNamed('/screen-one', arguments: {'name': 'BAWLOW'}),
              color: Colors.amber,
              child: Text("Screen One"),
            ),
            MaterialButton(
              onPressed: () => Get.toNamed('/screen-two'),
              color: Colors.amber,
              child: Text("Screen Two"),
            ),
            MaterialButton(
              onPressed: () {
                AuthController authController = Get.find();
                authController.logIn('1');
                Get.toNamed('/screen-one');
              },
              color: Colors.amber,
              child: Text("sign in"),
            ),
            GetX<SettingsService>(
              builder:
                  (controller) => MaterialButton(
                    onPressed: () {
                      controller.increase();
                    },
                    color: Colors.amber,
                    child: Text("${controller.counter}"),
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
              },
              color: Colors.amber,
              child: Text("sign in"),
            ),
            MaterialButton(
              onPressed: () {
                myLocaleController.changeLang('ar');
              },
              color: Colors.amber,
              child: Text("change ar "),
            ),
            MaterialButton(
              onPressed: () {
                myLocaleController.changeLang('en');
              },
              color: Colors.amber,
              child: Text("change en "),
            ),
          ],
        ),
      ),
    );
  }
}
