import 'package:flutter/foundation.dart';
import 'package:gql/src/ast/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_site/others/queries.dart';
import 'package:my_site/resources/dims/api_dims.dart';

import '../model/base_model.dart';
import '../model/user.dart';
import '../others/resource.dart';

class Api {
  static final _baseUrl = 'https://gleaming-hare-beanie.cyclic.app';
  static final HttpLink _link = HttpLink('$_baseUrl/graphql');
  static final GraphQLClient client =
      GraphQLClient(link: _link, cache: GraphQLCache(store: HiveStore()));

  Future<Resource<T>> crudTypeCall<T extends BaseModel>(
      DocumentNode q, T object, bool credEmpty) async {
    if (credEmpty) return Failure<T>("Credentials empty");

    try {
      debugPrint("making graphql call");
      final result = await client
          .query(QueryOptions(document: q))
          .timeout(ApiDims.standardTimeOut);
      if (result.hasException) {
        return Failure<T>(result.exception.toString());
      }
      return Success<T>(object.fromJson(result.data!));
    } on GraphQLError catch (e) {
      return Failure<T>(e.message.toString());
    } catch (e) {
      return Failure<T>(e.toString());
    }
  }
}

class AuthApi extends Api {
  Future<Resource<User>> getUserByEmail(String email) async {
    return await Api().crudTypeCall(AuthQueries().getUserQuery(email),
        User("", email, "", false), email.isEmpty);
  }

  Future<Resource<User>> loginUser(String email, String password) async {
    print("logging in with ${Api._baseUrl}");
    try {
      QueryResult result = await Api.client.query(QueryOptions(
          document: AuthQueries().loginUserQuery(email, password)));

        print(result.data);

      return checkForSuccess(result.data!['logInUser']);
    } on GraphQLError catch (e) {
      print("graphqlerror :${e.message}");
      return Failure<User>(e.message);
    } catch (e) {
      print(e.toString());
      return Failure("${e.runtimeType} : $e");
    }
  }

  Future<Resource<User>> createUser(User user) async {
    if (user.paramEmpty()) return Failure<User>("Credentials Empty");
    debugPrint("signing up");
    try {
      QueryResult result = await Api.client.query(QueryOptions(
          document: AuthQueries()
              .addUserQuery(user.email!, user.password!, user.admin!)));
      if (result.data == null) {
        return Failure(result.exception.toString());
      }
      return checkForSuccess((result.data!['addUser']));
    } on GraphQLError catch (e) {
      debugPrint(e.message);
      return Failure<User>(e.message);
    } catch (e) {
      debugPrint(e.toString());
      return Failure<User>(e.toString());
    }
  }

  Resource<User> checkForSuccess(Map<String, dynamic> json) {
    if (json['id'] == "wrong credentials" ||
        json['id'] == "user already exists") {
      return Failure<User>(json['id']);
    } else {
      return Success<User>(User.fromJson(json));
    }
  }
}
