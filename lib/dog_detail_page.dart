import 'package:flutter/material.dart';
import 'dog_model.dart';

class DogDetailPage extends StatefulWidget{
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  State<StatefulWidget> createState() => DogDetailPageState();
}

class DogDetailPageState extends State<DogDetailPage>{
  final double dogAvatarSize = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }

  Widget get dogImage{
    return Hero(
      tag: widget.dog,
      child: Container(
        height: dogAvatarSize,
        width: dogAvatarSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.dog.imageUrl),
          )
        ),
      )
    );
  }

  Widget get dogRating{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(
          "${widget.dog.rating}/10",
          style: Theme.of(context).textTheme.display2,
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }

  Widget get dogProfile{
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            "${widget.dog.name} 🎾",
            style: TextStyle(fontSize: 32.0) 
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.dog.description),
          ),
          dogRating
        ],
      ),
    );
  }

  
}