import 'package:MovieTorrentDownloader/Model/listmovies.dart';
import 'package:MovieTorrentDownloader/Screens/detailed_page/cover_with_title.dart';
import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedPage extends StatelessWidget {
  final Movie movie;
  DetailedPage(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body(){
    return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(Get.context).padding.top
          ),
          CoverWithTitle(movie),
          SizedBox(
            height: 10,
          ),
          _rating(),

          _details(),

          _storyLine(),

          _fullCast()
        ],
      ),
    );
  }

  Widget _fullCast(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Full Cast",style: TextStyle(color: CustomColors.primaryblue,fontSize: 18,fontWeight: FontWeight.bold),),

          _castList()
        ],
      ),
    );
  }

  Widget _castList(){
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
              child: Row(
          children: [
            _eachCastMember(),
            _eachCastMember(),
            _eachCastMember(),
            _eachCastMember(),
            _eachCastMember(),
            _eachCastMember(),
          ],
        ),
      );
  }

  Widget _eachCastMember(){
    double imageSize=Get.width*.15;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/dog.jpg",
            height: imageSize,
            width: imageSize,
            fit: BoxFit.fitHeight,
            )
          ),

          SizedBox(
            height: 10,
          ),

          Text("Jay Baruchel",style: TextStyle(color: CustomColors.primaryblue,fontWeight: FontWeight.bold),),

           Text("Hiccup",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w100),),


        ],
      ),
    );
  }

  Widget _storyLine(){
    final _description= movie.descriptionFull;
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
          _eachDetailsText(lable: "Release Date:",content: movie.year.toString()),
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
      child: Image.network(movie.largeCoverImage,
      height: Get.height*.3,
      width: Get.width*.3,
      fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _rating(){
    TextStyle textStyle =TextStyle(color: CustomColors.primaryblue,fontWeight: FontWeight.bold,fontSize: 18);
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${movie.rating}/10", style: textStyle,),

          Text("IMDb",style: textStyle,)
        ],
      ),
    );
  }

}

class _description {
}