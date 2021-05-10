import 'package:finalproject/app/utils/loggedUser.dart';

class PersonDoc {
  String id;
  String title;
  String content;

  PersonDoc({this.id, this.title, this.content});

  static PersonDoc fromMap(String id, Map<String, dynamic> map) {
    return new PersonDoc(id: id, content: map["content"], title: map["title"]);
  }

  Map<String, dynamic> toMap() {
    return {"content": content, "title": title, "userId": LoggedUser().user.id};
  }
}
