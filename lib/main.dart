import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(
        title:"We Rate Dogs"
      )
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
    ..add(new Dog('Popcorn','Portland', 'Popcorn is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(new Dog('Churchill', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(new Dog('Otto', 'Prague, CZ',
          'Star good boy on international snooze team.'))
    ..add(new Dog('Duke', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(new Dog('Burger','North Pole, Earth', 'Self proclaimed human lover.'))
    ..add(new Dog('Max','Portland', 'Self proclaimed human lover.'))
    ..add(new Dog('Charlie','Seattle, WA, USA', 'Self proclaimed human lover.'))
    ..add(new Dog('Bella','Pargue CZ', 'Self proclaimed human lover.'))
    ..add(new Dog('Rex','Portland', 'Self proclaimed human lover.'));

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: showNewDogForm,
              icon: Icon(Icons.add),
            )
          ]
        ),
        body: Container(
          child: DogList(initialDoggos),
        )
    );
  }

  Future showNewDogForm() async{
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return AddDogFormPage();
        }
      )
    );
    

    if(newDog != null){
      initialDoggos.add(newDog);
    }
  }
}
