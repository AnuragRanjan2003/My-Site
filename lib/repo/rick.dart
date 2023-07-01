import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_site/others/queries.dart';

class Rick {
  static const _baseUrl = "https://my-site-backend.onrender.com/";
  static final HttpLink _link = HttpLink('${_baseUrl}graphql');
  static final GraphQLClient _qlClient =
      GraphQLClient(link: _link, cache: GraphQLCache(store: HiveStore()));

  getSimple() async {
    if (kDebugMode) {
      print("simple get req");
    }
    try {
      Dio dio = Dio();
      final res = await dio.get(_baseUrl);
      if (kDebugMode) {
        print("resonse : ${res.statusCode}");
      }
      if (kDebugMode) {
        print("resonse : ${res.data}");
      }
      if (kDebugMode) {
        print(res);
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("simple http:" + e.message.toString());
      }
    }
  }

  Future<QueryResult<Object?>> makeQuery() async {
    debugPrint("making query to : ${_link.toString()}");
    QueryResult result =
        await _qlClient.query(QueryOptions(document: gql("""query {
                user ( email : "abc@gmail.com"){
                      id
                      admin
                }
            }""")));

    return result;
  }

  Future<QueryResult<Object?>> LogIn() async {
    debugPrint("making query to : ${_link.toString()}");
    QueryResult result = await _qlClient.query(QueryOptions(
        document: AuthQueries().loginUserQuery('abc@gmail.com', '123')));

    return result;
  }
}
