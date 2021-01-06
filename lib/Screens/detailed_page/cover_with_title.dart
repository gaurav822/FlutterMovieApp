import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CoverWithTitle extends StatelessWidget {
  List<String> _genreList = ["Animation", "Action", "Adventure"];
  @override
  Widget build(BuildContext context) {
    return coverWithTitle();
  }

  Widget coverWithTitle(){
  
  return SizedBox(
           height: Get.height*.25,
          width: Get.width,
          child: Stack(children: [
            _backGround(), 
            _opacity(),
            _movieInfo(),
            
            ]));
      
  }

  Widget _backBtn(){
    return IconButton(
      onPressed: (){
        Get.back();
      },
      icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
    );
  }

  Widget _backGround(){
    return 
    ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
                child: Image.asset(
            "assets/dog.jpg",
            fit: BoxFit.fitHeight,
            height: Get.height*.25,
          ),
      
      );
  }

  Widget _opacity(){
    return Opacity(
      opacity: 0.3,
      child: Container(
        height: Get.height*.25,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )
        ),
      ),
    );
  }

  Widget _movieInfo(){
  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backBtn(),
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            
                _title(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                _review(),
                SizedBox(
                   width: 50,
                ),
                _duration(),
              ],
            ),
             
            
            _genre(),
          ],
        ),
       ]
      ),
    );
  }

  Widget _review(){
    return Text("1456 reviews",style: TextStyle(
      color: Colors.grey.shade300
    ),);
  }

  Widget _title(){
    return RichText(
      text: TextSpan(
        text: "How to Train your Dragon: The Hidden World",
        style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "(2019)",
            style: TextStyle(color: Colors.grey.shade300,fontSize: 14)
          )
        ]
      ),
    );
  }

  Widget _duration(){
    return Text("1h 44min",style: TextStyle(
      color: Colors.grey.shade300
    ),);
  }

  Widget _genre(){
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
        color: Colors.black26
      ),
      child: Text(genre,style: TextStyle(fontSize: 12,color: Colors.white),)
      );
  }
}

