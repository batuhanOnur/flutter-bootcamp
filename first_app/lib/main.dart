import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   home: Home()
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        centerTitle: true,
        backgroundColor:Colors.red[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.amber,
            child:Text('two'),
          ),
          Center(
            child: Container(
             padding: EdgeInsets.all(20.0),
             color: Colors.pinkAccent,
             child:Text('one'),
      ),
          ),
          Container(
            padding: EdgeInsets.all(40.0),
            color: Colors.cyan,
            child:Text('three'),
          ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        child: Text('click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}

