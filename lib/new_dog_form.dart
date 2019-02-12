import 'package:flutter/material.dart';

class AddDogFormPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AddDogFormPageState();
}

class AddDogFormPageState extends State<AddDogFormPage>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new Dog"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Name of the pup"
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Pup's location"
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "All about the pup"
                  )
                )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context){
                    return RaisedButton(
                      onPressed: ()=> print('PRESSED'),
                      color: Colors.indigoAccent,
                      child: Text('Submit')
                    );
                  },
                )
              )
            ],
          )
        )
      ),
    );
  }
}