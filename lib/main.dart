import 'package:flutter/material.dart';
import 'dog_mode.dart';

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
  List<Dog> initialDoggos = []
  ..add(new Dog('Churcill','Portland', 'Churcill is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
  ..add(new Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
  ..add(new Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
  ..add(new Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
  ..add(new Dog('Burger','North Pole, Earth', 'Self proclaimed human lover.'));
  
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
