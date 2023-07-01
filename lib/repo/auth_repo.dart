import 'package:my_site/others/resource.dart';
import 'package:my_site/repo/api.dart';

import '../model/user.dart';

class AuthRepo {
  Future<Resource<User>> loginUser(String email, String password) async {
    return await AuthApi().loginUser(email, password);
  }

  Future<Resource<User>> getUserWithEmail(String email) async {
    return await AuthApi().getUserByEmail(email);
  }

  Future<Resource<User>> createUser(String email, String password) async {
    return await AuthApi().createUser(User('', email, password, false));
  }
}
