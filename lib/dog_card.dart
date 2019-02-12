import 'package:flutter/material.dart';
import 'dog_detail_page.dart';
import 'dog_model.dart';

class DogCard extends StatefulWidget{
  final Dog dog;

  DogCard(this.dog);

  @override
  State<StatefulWidget> createState() => DogCardState(dog);
}

class DogCardState extends State<DogCard>{
  Dog dog;
  String renderUrl;

  DogCardState(this.dog);

  
  @override
  void initState() {
    super.initState();
    renderDogPic();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: dogCard,
              ),
              Positioned(top: 7.5, child: dogImage),
            ],
          ),
        )
      )
    );
  }

  Widget get dogImage {
    return Hero(
      tag: dog,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(renderUrl ?? ''),
          )
        )
      )
    );
  }

  Widget get dogCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                widget.dog.name,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                widget.dog.location,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star
                  ),
                  Text(": ${widget.dog.rating}/ 10")
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  void renderDogPic() async{
    await dog.getImageUrl();
    setState(() {
      renderUrl = dog.imageUrl;

      print(renderUrl);
    });
  }

  showDogDetailPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          return DogDetailPage(dog);
        }
      )
    );
  }

}