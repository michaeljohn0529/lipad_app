import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:LIPAD/settings_page/settings_page_controller.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomePageController extends GetxController {
  var loading = true.obs;
  Rx<AccelerometerEvent> accelerometerData = AccelerometerEvent(0, 0, 0).obs;
  SettingsPageController settingsPageController =
      Get.find<SettingsPageController>();

  @override
  void onInit() {
    super.onInit();
    Stream<AccelerometerEvent> astream = accelerometerEvents;
    accelerometerData.bindStream(astream.map((event) => event));
    loading.value = false;
    Timer.periodic(1.seconds, (timer) {
      sendData();
    });
  }

  void sendData() {
    var data = {
      'pitch': accelerometerData.value.x.round(),
      'roll': accelerometerData.value.y.round(),
    };
    settingsPageController.connection.output
        .add(ascii.encode('${jsonEncode(data)}\n'));
  }
}
