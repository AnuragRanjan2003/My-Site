import 'package:gql/src/ast/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthQueries {
  DocumentNode addUserQuery(String email, String password, bool admin) =>
      gql("""mutation {
            addUser(email : "$email",password : "$password" ,admin:$admin){
                id
                admin
                email
            }
      }""");

  DocumentNode getUserQuery(String email) => gql("""query {
            user(email : "$email"){
                email
                password
                id
                admin
            }
      }""");


DocumentNode loginUserQuery(String email, String password) => gql("""query {
  logInUser(email:"$email",password:"$password"){
    id
    email
    admin
  }
}""");
}
