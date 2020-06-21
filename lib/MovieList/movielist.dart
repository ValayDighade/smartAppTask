import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/DataController/fetchdata.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/MovieDes/moviedescription.dart';
import 'file:///D:/ValayProject/smart_app/smart_app/lib/ModelClass/moviemodel.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => new _MovieListState();
}

class _MovieListState extends State<MovieList> {
  TextEditingController controller = new TextEditingController();
  var appState;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<NewsArticleListViewModel>(context, listen: false).getMovieList();
    });
     super.initState();
  }

  @override
  void dispose() {
    appState.userDetails.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     appState = Provider.of<NewsArticleListViewModel>(context);


    return SafeArea(
      child: new Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Row(
            children: <Widget>[
              Expanded(
                flex:4,
                child: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(

                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
              ),
              Expanded(
                flex: 1,
                child: new IconButton(
                  icon: Text("Cancle",style: TextStyle(fontSize: 14),),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ],
          ),
        ),
        body:MovieListClass(context)
      ),
    );
  }


  MovieListClass(context) {

    return Column(
      children: <Widget>[

        new Expanded(
          child: appState.searchResult.length != 0 || controller.text.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListView.builder(
                  itemCount: appState.searchResult.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDescription(
                          title:appState.searchResult[i].title ,
                          overview: appState.searchResult[i].overview ,
                          image:appState.searchResult[i].posterpath ,
                          date: appState.searchResult[i].date ,
                          popularity: appState.searchResult[i].popularity ,

                        )));
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            CachedNetworkImage(
                              height:100,
                              width: 100,
                              fit: BoxFit.fill,
                              imageUrl: imagePath+appState.searchResult[i].posterpath,
                              placeholder: (context, url) => SizedBox(
                                  height:100,
                                  width: 100,
                                  child: Center(child: Text("Loading"))),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text( appState.searchResult[i].title),
                                      SizedBox(height: 15,),
                                      Text( appState.searchResult[i].overview),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Divider(thickness: 1,color: Colors.white,)
                        ],
                      ),
                    );
                  }

                ),
              )
              :    new ListView.builder(
                itemCount: appState.userDetails.length,
                itemBuilder: (context, i) {
                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDescription(
                       title:appState.userDetails[i].title ,
                       overview: appState.userDetails[i].overview ,
                       image:appState.userDetails[i].posterpath ,
                       date: appState.userDetails[i].date ,
                       popularity: appState.userDetails[i].popularity ,

                     )));
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Container(
                                 height:100,
                                 width: 100,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: NetworkImage(imagePath+appState.userDetails[i].posterpath ,),
                                     fit: BoxFit.fill
                                   )
                                 ),
                               ),
                               SizedBox(width: 15,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text( appState.userDetails[i].title),
                                    SizedBox(height: 15,),
                                    Text( appState.userDetails[i].overview),
                                  ],
                              ),
                               ),

                             ],
                           ),
                         ),
                         Divider(thickness: 1,color: Colors.white,)
                       ],
                     ),
                   ),
                 );
                },
              ),
        ),
      ],
    );
  }



  onSearchTextChanged(String text) async {
    appState.searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    appState.userDetails.forEach((userDetail) {
      if (userDetail.title.toLowerCase().contains(text))
        appState.searchResult.add(userDetail);
    });

    setState(() {});
  }


}
