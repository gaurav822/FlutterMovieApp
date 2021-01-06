import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MovieCard extends StatelessWidget {
  List<String> _genreList =["Sci-fi","Action","Comedy","Horror"];
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: Get.width*.05),
      height: Get.height*.30,
      width: Get.width*.9,
      // color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            left: Get.width*.05,
            bottom: 0,
            child: _bottomCard()
            ),
          Positioned(
            left: Get.width*.05,
            child: _movieCover())
        ],
      ),
    );
  }

  Widget _bottomCard(){
    return Container(
      height: Get.height*.25,
      width: Get.width*.9,
      decoration: BoxDecoration(
        color: CustomColors.background,
        borderRadius: BorderRadius.circular(15),
        boxShadow: _cardShadow(),
      
        
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
        _movieDetails()
        ]),
    );
  }

  List<BoxShadow> _cardShadow()=> <BoxShadow>[
    BoxShadow(
    offset: Offset(1,1),
    color: CustomColors.shadow,
    blurRadius: 3,
    spreadRadius: 1

    )
  ];

  Widget _movieCover(){
    return  ClipRRect(
      borderRadius: BorderRadius.circular(15),
          child: Image.asset(
        "assets/dog.jpg",
        height: Get.height*.25,
        width: Get.width*.3,
        fit: BoxFit.fitHeight,

      ),
    );
  
  }

  Widget _movieDetails(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _title(),__ratingDuration(),_genres()
        ],
      ),
    );
  }

  Widget _title(){
    return Text("Avengers: End Game", style: TextStyle(color: CustomColors.primaryblue,fontSize: 20,fontWeight: FontWeight.bold,));
  }

  Widget __ratingDuration(){
    return Row(
      children: [
        Icon(
          Icons.star,
          color: CustomColors.orange,
        ),
        Text("8.7/10 Imdb"),
        SizedBox(
          width: 10,
        ),
        Text("3h 2min")
      ],
    );
  }

  Widget _genres(){
    return Container(
      // color: Colors.blue,
      height: 40,
      width: Get.width*.55,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
              child: Row(
        
          children: [
            for(String genre in _genreList) _eachGenre(genre)
          ],
        ),
      )
    );
  }

  _eachGenre(String genre){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2.5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: CustomColors.lightPurple
      ),
      child: Text(genre,style: TextStyle(fontSize: 12,color: CustomColors.primaryblue),)
      );
  }
}