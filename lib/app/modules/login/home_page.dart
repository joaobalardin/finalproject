import 'package:flutter/material.dart';
import 'package:photo_manager_app/components/sidebar/side_bar_item.dart';
import 'package:photo_manager_app/modules/essay/essay_module.dart';
import 'package:photo_manager_app/modules/finance/finance_module.dart';
import 'package:photo_manager_app/modules/objective/objectives_module.dart';

import '../../components/sidebar/side_bar_widget.dart';
import 'home_bloc.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Adriano"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc = HomeModule.to.getBloc<HomeBloc>();
  List<SideBarItem> items = [
    SideBarItem(name: "Ensaios", buildModule: () => EssayModule()),
    SideBarItem(name: "Financeiro", buildModule: () => FinanceModule()),
    SideBarItem(name: "Objetivos", buildModule: () => ObjectivesModule()),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photographer"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text("Olá"),
                ),
              ),
            ],
          ),
        ),
        drawer: SideBarWidget(items));
  }
}
