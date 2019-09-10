import 'package:amlorganizer/screens/responsibilities.dart';
import 'package:amlorganizer/ui/mainScreenBtn.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aml '19")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          children: <Widget>[
            DrawerHeader(
              child: Text('Aml organizers app',
                  style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(100),
              ),
            ),
            ListTile(title: Text('General Tools'), onTap: () {}),
            ListTile(title: Text('Events Tools'), onTap: () {}),
            ListTile(title: Text('Expo Tools'), onTap: () {}),
            ListTile(title: Text('CnS Tools'), onTap: () {}),
          ],
        ),
      ),
      body: Container(
        child: GridView.count(crossAxisCount: 2, children: <Widget>[
          MainScreenBtn(
            text: "Responsibilities",
            callback: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResponsibilityPage()));
            },
          ),
          MainScreenBtn(
            text: "Events Tools",
            callback: () {},
          ),
          MainScreenBtn(
            text: "Expo Tools",
            callback: () {},
          ),
          MainScreenBtn(
            text: "CnS Tools",
            callback: () {},
          ),
        ]),
      ),
    );
  }
}
