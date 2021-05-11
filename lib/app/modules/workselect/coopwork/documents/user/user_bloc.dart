import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:finalproject/app/bloc/coop_doc_bloc.dart';
import 'package:finalproject/app/bloc/user_bloc.dart';
import 'package:finalproject/app/model/coopDoc.dart';
import 'package:finalproject/app/model/user.dart';
import 'package:rxdart/rxdart.dart';

class UserPageBloc extends BlocBase {
  UserBloc userBloc = new UserBloc();
  CoopDocBloc coopDocBloc = new CoopDocBloc();
  BehaviorSubject<List<User>> userBehaviorSubject = BehaviorSubject();
  CoopDoc coopDoc;
  String username = "";

  UserPageBloc(this.coopDoc);

  Future<void> findAllUsers() async {
    List<User> users = [];
    for (String userId in coopDoc.users)
      users.add(await userBloc.findById(userId));
    userBehaviorSubject.add(users);
  }

  updateUsername(text) {
    username = text;
  }

  adduser() async {
    User user = await userBloc.findByUserName(username);
    coopDoc.users.add(user.id);
    await coopDocBloc.update(coopDoc);
    findAllUsers();
  }
}
