import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String rate = "0.0";
  String data;

  Future<void> fetchData() async {
    http.Response response =
        await http.get("https://api.exchangeratesapi.io/latest");
    data = response.body;

    setState(() {
      rate = jsonDecode(data)['rates']['USD'].toString();
    });
  }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Döviz Takip',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.orange[900],
            ),
            onPressed: () {
              fetchData();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: Icon(Icons.attach_money),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Dolar',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.0),
                      child: Text(
                        rate,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
