import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:my_site/model/popup_item.dart';
import 'package:my_site/others/resource.dart';
import 'package:my_site/repo/auth_repo.dart';
import 'package:my_site/resources/images/images.dart';

import '../../model/user.dart';

class AuthController extends GetxController {
  RxBool admin = true.obs;
  Rxn<User> user = Rxn<User>();
  Rxn<String> authError = Rxn<String>();
  AuthRepo repo = AuthRepo();
  Rx<String> emailError = "".obs;
  Rx<String> passError = "".obs;
  Rx<bool> loading = false.obs;
  
  List<PopUpItem> popupList = [PopUpItem("Create Blog", ProjectAssetImages.compose) , PopUpItem("Add Project", ProjectAssetImages.project), PopUpItem("Add Techstack", ProjectAssetImages.dart)];

  toggleAdmin() {
    admin.value = !admin.value;
    debugPrint("${admin.value}");
  }

  loginUser(String email, String password) {
    loading.value = true;
    // user already logged in
    if (user.value != null) {
      loading.value = false;
    }

    repo.loginUser(email, password).then((value) {
      debugPrint(value.data.toString());
      if (value is Success) {
        authError.value = null;
        clearErrors();
        user.value = value.data;
        admin.value = value.data!.admin!;
      } else {
        user.value = null;
        authError.value = value.error;
        debugPrint(value.error);
        emailError.value = value.error;
        passError.value = value.error;
      }
      loading.value = false;
    });
  }

  signUpUser(String email, String password) {
    loading.value = true;
    if (user.value != null) return;

    repo.createUser(email, password).then((res) {
      if (res is Success<User>) {
        user.value = res.data!;
        admin.value = res.data!.admin!;
        debugPrint(user.value!.toString());
      } else {
        user.value = null;

        emailError.value = res.error;
        passError.value = res.error;
        debugPrint(res.error);
      }
      loading.value = false;
    });
  }

  void setEmailError() {
    passError.value = "";
    emailError.value = "Please provide Email";
  }

  void setPassError() {
    emailError.value = "";
    passError.value = "Please provide Email";
  }

  void clearErrors() {
    emailError.value = "";
    passError.value = "";
  }

  bool hasEmailError() => emailError.value.isNotEmpty;

  bool hasPassError() => passError.value.isNotEmpty;

  bool userExists() => user.value != null;

  userIsAdmin() => admin.value;

  void logOut() {
    user.value = null;
    admin.value = false;
    emailError.value = "";
    passError.value = "";
  }
}
