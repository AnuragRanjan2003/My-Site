import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool admin = false.obs;

  toggleAdmin() {
    admin.value = !admin.value;
    debugPrint("${admin.value}");
  }
}