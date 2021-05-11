import 'package:finalproject/app/utils/loggedUser.dart';

class CoopDoc {
  String id;
  String title;
  String content;

  CoopDoc({this.id, this.title, this.content});

  static CoopDoc fromMap(String id, Map<String, dynamic> map) {
    return new CoopDoc(id: id, content: map["content"], title: map["title"]);
  }

  Map<String, dynamic> toMap() {
    return {"content": content, "title": title, "userId": LoggedUser().user.id};
  }
}
