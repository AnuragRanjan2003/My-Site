import 'package:get/get.dart';
import 'package:my_site/resources/localdata/dummy_data.dart';

import '../../model/project_model.dart';

class SuccessFulSectionController extends GetxController {

  RxList<Project> list = <Project>[].obs;

  @override
  void onInit() {
    SuccessData().list.then((value) => list.value = value);

  }


}