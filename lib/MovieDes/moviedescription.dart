import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartapp/CommonClass/DelayedAimation.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/DataController/fetchdata.dart';


class MovieDescription extends StatefulWidget {
  String title,overview,image, date,popularity;

  MovieDescription({Key key, this.title, this.overview, this.image, this.date, this.popularity}) : super(key: key);
  @override
  _MovieDescriptionState createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription>  with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    print(widget.title);
    print(widget.overview);
    print(widget.image);
    print(widget.date);
    print(widget.popularity);
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0)).animate(controller);
    controller.reverse();


    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(title: Text("Back"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath+widget.image),
                fit: BoxFit.fill
              ),
            ),
          ),
          DelayedAimation(
            delay:1000,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: offset,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black54.withOpacity(0.5),
                     ),
                      height: 250,
                    //width: double.infinity,

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height:15,),
                          Text(widget.date,style: TextStyle(color: Colors.white,fontSize: 14),),
                          SizedBox(height:5,),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star,color: Colors.white,),
                              SizedBox(width: 5,),
                              Text(widget.popularity+" %",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          SizedBox(height:5,),
                          Expanded(
                            child: ListView(children: [Text(widget.overview,style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
