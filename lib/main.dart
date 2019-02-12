import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new HomePage(
      title:"Rate my dog"
    );
  }
}

class HomePage extends StatefulWidget{
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, textDirection: TextDirection.ltr,),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          child: Text('body', textDirection: TextDirection.ltr,)
        )
      )
    );
  }
}
