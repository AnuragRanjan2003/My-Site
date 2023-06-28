import 'package:get/get.dart';
import 'package:my_site/resources/localdata/dummy_data.dart';

import '../../model/project_model.dart';

class ProjectController extends GetxController {
  RxList<Project> projectList = <Project>[].obs;
  RxInt hovered = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    hovered.value = -1;
    ProjectData().list.then((value) => projectList.value = value);
  }
}
