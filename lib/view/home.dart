import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:getx_flutter_demo/controller/home_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Home'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          print(
            "<<<<<<<<<<<<<<<<<<<<<<<<<<<< Builder one >>>>>>>>>>>>>>>>>>>>>>>>>>>>",
          );
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => controller.increment(),
                      icon: Icon(Icons.plus_one),
                    ),
                    Text(
                      '${controller.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      onPressed: () => controller.decrement(),
                      icon: Icon(Icons.exposure_minus_1),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
