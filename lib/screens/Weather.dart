import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/datacontroller.dart';

class Weather extends StatelessWidget {
  final controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Obx(() {
            var data = controller.dataModel.value;
            return Column(children: [
              Text("${data.name ?? ""}",
                  style: new TextStyle(color: Colors.white)),
              Text("${data.main ?? ""}", style: new TextStyle(color: Colors.white, fontSize: 32.0)),
              Text("${data.temp ?? ""}",  style: new TextStyle(color: Colors.white)),
              Image.network('https://openweathermap.org/img/w/01d.png'),
              Text("${data.date ?? ""}", style: new TextStyle(color: Colors.white)),
              Text('18:30', style: new TextStyle(color: Colors.white)),
            ]);
          }),
        ),
      ],
    );
  }
}