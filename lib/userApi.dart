import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/userModel.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      title: "App pertama",
      home: User(),
      debugShowCheckedModeBanner: false,
    ));

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List<UserDetail> _list = [];
  var loading = false;

  Future<Null> fetchData() async {
    var url = "https://jsonplaceholder.typicode.com/users/";
    final response = await http.get(Uri.parse(url));
    setState(() {
      loading = true;
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        setState(() {
          _list.add(UserDetail.fromJson(i));
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, i) {
                  final a = _list[i];
                  return Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(a.name),
                        Text(a.address.geo.lat),
                        Text(a.address.geo.lng),
                      ],
                    ),
                  );
                },
              ));
  }
}
