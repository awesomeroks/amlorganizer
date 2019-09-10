import 'package:amlorganizer/googleSheets.dart';
import 'package:amlorganizer/ui/mainScreenBtn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class ResponsibilityPage extends StatefulWidget {
  ResponsibilityPage({Key key}) : super(key: key);

  _ResponsibilityPageState createState() => _ResponsibilityPageState();
}

class _ResponsibilityPageState extends State<ResponsibilityPage> {
  var data;
  var tempdata;
  String searchTerm;
  @override
  void initState() {
    super.initState();
    refreshPage();
  }

  void refreshPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = prefs.getString("responsibilityList");
    data = jsonDecode(x);
    setState(() {});
    getData("responsibilityList!A2:E").then((onValue) {
      data = onValue;

      prefs.setString("responsibilityList", json.encode(data));

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // bottom: PreferredSize(
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        //     child: TextField(
        //       onChanged: (val) {
        //         searchTerm = val;
        //         if(val.length == 1){
        //           tempdata = [];
        //         }
        //         print(tempdata);
        //         print(val);
        //         // data.foreach((term) {
        //         //   print(term);
        //         //   if (term[0].toString().toLowerCase().contains(searchTerm.toLowerCase())) {
        //         //     tempdata.add(term);
        //         //   }
        //         // });

        //         setState((){});
        //       },
        //       decoration: InputDecoration(
        //           suffix: IconButton(
        //             icon: Icon(Icons.close),
        //             onPressed: () {
        //               searchTerm = "";
        //               tempdata = data;
        //             },
        //           ),
        //           border: InputBorder.none,
        //           hintText: 'Search'),
        //     ),
        //   ),
        //   preferredSize: Size(50, 50),
        // ),
        title: Text("Responsibilities"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: refreshPage,
          )
        ],
      ),
      body: Container(
          child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          data[index][0],
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(data[index][1]),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data[index][2],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: () {
                            //location
                          }),
                      IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            print('tel://' + data[index][3].toString());
                            launch('tel://' + data[index][3].toString());
                          }),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
