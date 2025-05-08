import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    print('init home controller.');
  }

  @override
  void onReady() {
    super.onReady();
    print('ready home controller.');
  }

  @override
  void onClose() {
    print('close home controller.');

    super.onClose();
  }
}
