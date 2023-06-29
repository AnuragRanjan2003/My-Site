import 'package:get/get.dart';
import 'package:my_site/resources/localdata/dummy_data.dart';

import '../model/blog_model.dart';

class BlogController extends GetxController {
  RxList<DisplayBlog> list = <DisplayBlog>[].obs;

  @override
  void onInit() {
    super.onInit();
    BlogData().list.then((value) => list.value = value);
  }
}
