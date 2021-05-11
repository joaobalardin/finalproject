import 'package:finalproject/app/utils/loggedUser.dart';

class CoopDoc {
  String id;
  String title;
  String content;
  List <String> users;

  CoopDoc({this.id, this.title, this.content, this.users});

  static CoopDoc fromMap(String id, Map<String, dynamic> map) {
    return new CoopDoc(id: id, content: map["content"], title: map["title"], users: dynamicToString(map["users"]));
  }

  static List<String> dynamicToString(List<dynamic> list){
    return list.map((e) => "$e").toList();
  }

  Map<String, dynamic> toMap() {
    return {"content": content, "title": title, "users": users};
  }
}
