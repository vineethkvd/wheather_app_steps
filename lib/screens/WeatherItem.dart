import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/datacontroller.dart';

class WeatherItem extends StatelessWidget {
  final controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Obx(() {
                var data = controller.dataModel.value;
                return Column(children: [
                  Text("${data.name ?? ""}",
                      style: new TextStyle(color: Colors.black)),
                  Text("${data.main ?? ""}",
                      style: new TextStyle(color: Colors.black, fontSize: 24.0)),
                  Text("${data.temp ?? ""}", style: new TextStyle(color: Colors.black)),
                  Image.network('https://openweathermap.org/img/w/01d.png'),
                  Text("${data.date ?? ""}", style: new TextStyle(color: Colors.black)),
                ]);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
