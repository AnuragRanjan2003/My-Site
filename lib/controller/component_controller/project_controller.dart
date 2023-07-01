import 'package:get/get.dart';
import 'package:my_site/repo/auth_repo.dart';
import 'package:my_site/resources/localdata/dummy_data.dart';

import '../../model/project_model.dart';

class ProjectController extends GetxController {
  AuthRepo repo = AuthRepo();
  RxList<Project> projectList = <Project>[].obs;
  RxInt hovered = (-1).obs;
  RxString res = "".obs;

  @override
  void onInit() {
    super.onInit();
    hovered.value = -1;
    ProjectData().list.then((value) => projectList.value = value);
  }
}
