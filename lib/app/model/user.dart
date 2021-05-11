class User{
  String username;
  String id;

  User({this.username, this.id});

  static User fromMap(String id, Map<String, dynamic> data) {
    return new User(id: id, username: data["username"]);
  }
}