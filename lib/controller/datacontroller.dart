import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/wheathermodel.dart';
import '../services/wheatherdataservices.dart';

class DataController extends GetxController {
  final Rx<WeatherDataModel> dataModel = WeatherDataModel(
    date: DateTime.parse('2023-10-23'),
    name: '',
    temp: 306,
    main: '',
    icon: '',
  ).obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      final data = await WheaterDataServices().getService();
      //see top datamodel
      dataModel.value = data;
    } catch (e) {
      Get.snackbar("No data", "$e");
    }
  }
}
