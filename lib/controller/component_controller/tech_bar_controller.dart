import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_site/model/tech_item.dart';
import 'package:my_site/resources/localdata/dummy_data.dart';

class TechBarController extends GetxController {
  RxInt hoveredItem = (-1).obs;

  RxList<TechItem> list = <TechItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    hoveredItem.value = -1;
    list.value = TechData.list;
  }

  void hover(int a) {
    if (kDebugMode) {
      print("hovered : controller : $a");
    }
    hoveredItem.value = a;
  }

  void unHover() {
    if (kDebugMode) {
      print("unH4overed : controller : -1");
    }
    hoveredItem.value = -1;
  }
}
