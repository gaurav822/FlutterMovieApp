import 'package:MovieTorrentDownloader/Screens/detailed_page/cover_with_title.dart';
import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(Get.context).padding.top
        ),
        CoverWithTitle(),
        SizedBox(
          height: 10,
        ),
        _rating(),

        _details(),

        _storyLine()
      ],
    );
  }

  Widget _storyLine(){
    final _description= "This is the test paragraph";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Storyline",style: TextStyle(color: CustomColors.primaryblue,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 20,
          ),
          Text(_description,
          style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _details(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _detailsText(),
          
          _movieCover()
        ],
      ),
    );
  }

  Widget _detailsText(){
    return SizedBox(
      width: Get.width*.55,
      height: Get.height*.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eachDetailsText(lable: "Release Date:",content: "January 9, 2019"),
          _eachDetailsText(lable: "Director:",content: "Dean Deblois"),
          _eachDetailsText(lable: "Writers:",content: "Dean Deblois, Cressida Cowell"),
        ],
      ),
    );
  }

  Widget _eachDetailsText({String lable, String content}){
    return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text(
                 lable, style: TextStyle(color: CustomColors.primaryblue,
                )
              ),
              Flexible(
                              child: Text(
                 content, style:TextStyle(color: CustomColors.primaryblue,fontWeight: FontWeight.bold) 
                ,
                ),
              )
            ]
          
          );
  }

  Widget _movieCover(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset("assets/dog.jpg",
      height: Get.height*.3,
      width: Get.width*.3,
      fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _rating(){
    TextStyle textStyle =TextStyle(color: CustomColors.primaryblue,fontWeight: FontWeight.bold,fontSize: 18);
    return Column(
      children: [
        Text("7.6/10", style: textStyle,),

        Text("IMDb",style: textStyle,)
      ],
    );
  }

}

class _description {
}