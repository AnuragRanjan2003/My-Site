import 'package:flutter/foundation.dart';
import 'package:gql/src/ast/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_site/others/queries.dart';
import 'package:my_site/resources/dims/api_dims.dart';

import '../model/base_model.dart';
import '../model/user.dart';
import '../others/resource.dart';

class Api {
  static const _baseUrl = "https://my-site-backend.onrender.com/";
  static final HttpLink _link = HttpLink('${_baseUrl}graphql');
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
  /*Future<Resource<User>> createUser(User user) async {
    if (user.email == null || user.password == null || user.admin == null) {
      return Failure<User>("Credentials empty");
    }

    try {
      final result = await client
          .query(QueryOptions(
              document: AuthQueries()
                  .addUserQuery(user.email!, user.password!, user.admin!)))
          .timeout(ApiDims.standardTimeOut);
      if (result.hasException) {
        return Failure<User>(result.exception.toString());
      }
      return Success<User>(User.fromJson(result.data!));
    } on GraphQLError catch (e) {
      return Failure<User>(e.message);
    } catch (e) {
      return Failure<User>(e.toString());
    }
  }*/


  /*Future<Resource<User>> getUserByEmail(String email) async {
    try {
      final res = await client
          .query(QueryOptions(document: AuthQueries().getUserQuery(email)))
          .timeout(ApiDims.standardTimeOut);
      if (res.hasException) {
        return Failure<User>(res.exception.toString());
      }
      return Success<User>(User.fromJson(res.data!));
    } on GraphQLError catch (e) {
      return Failure<User>(e.message);
    } catch (e) {
      return Failure<User>("unhandled error : ${e.toString()}");
    }
  }*/

  Future<Resource<User>> getUserByEmail(String email) async {
    return await Api().crudTypeCall(AuthQueries().getUserQuery(email),
        User("", email, "", false), email.isEmpty);
  }

  Future<Resource<User>> loginUser(String email, String password) async {
    debugPrint("logging in");
    try {
      QueryResult result = await Api.client.query(QueryOptions(
          document: AuthQueries().loginUserQuery(email , password)));

      return checkForSuccess(result.data!['logInUser']);
    } on GraphQLError catch (e) {
      debugPrint(e.message);
      return Failure<User>(e.message);
    }
  }

  Future<Resource<User>> createUser(User user) async {
    if(user.paramEmpty()) return Failure<User>("Credentials Empty");
    debugPrint("signing up");
    try {
      QueryResult result = await Api.client.query(QueryOptions(
          document: AuthQueries().addUserQuery(user.email!, user.password!, user.admin!)));
          if(result.data == null){
            return Failure(result.exception.toString());
          }
      return checkForSuccess((result.data!['addUser']));
    } on GraphQLError catch (e) {
      debugPrint(e.message);
      return Failure<User>(e.message);
    }
  }

  Resource<User> checkForSuccess(Map<String,dynamic> json){
    if(json['id']=="wrong credentials" || json['id']=="user already exists"){
      return Failure<User>(json['id']);
    }else{
      return Success<User>(User.fromJson(json));
    }
  }

}
