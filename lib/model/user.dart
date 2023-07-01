
import 'package:json_annotation/json_annotation.dart';
import 'package:my_site/model/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User  extends BaseModel<User>{
  final String? id;
  final String? email;
  final String? password;
  final bool? admin;


  @override
  Map<String,dynamic> toJson() => _$UserToJson(this);


  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  User(this.id, this.email, this.password, this.admin);

  @override
  String toString() {
    return "User ( email : $email , pass : $password , admin : $admin , id : $id )";
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  @override
  bool paramEmpty() {
    if(email==null || password==null || admin==null) return true;
    return (email!.isEmpty || password!.isEmpty );
  }
}