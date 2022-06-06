import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LIPAD/home_page/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('LIPAD'),
        ),
        body: controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "X: ${controller.accelerometerData.value.x.toPrecision(4).toString()}"),
                      Text(
                          "Y: ${controller.accelerometerData.value.y.toPrecision(4).toString()}"),
                      // Text("Heading: ${controller.compassData.value.toString()}"),
                      // Text(
                      //     "Reference Heading: ${controller.referenceHeading.value.toString()}"),
                      // Text(
                      //     "Heading Difference: ${controller.headingFromReference.toString()}"),
                      // ElevatedButton(
                      //     onPressed: controller.setReference,
                      //     child: Text('Set Heading Reference')),
                      // ElevatedButton(
                      //     onPressed: controller.sendData,
                      //     child: Text('Send Data')),
                    ],
                  ),
                )),
      ),
    ));
  }
}
