import 'package:MovieTorrentDownloader/Custom_Widgets/search_bar.dart';
import 'package:MovieTorrentDownloader/Custom_Widgets/trending_card.dart';
import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          SizedBox(
            
            height: Get.height*.43,
            width: Get.width,
            child: Stack(children: [
              _appBar(),
              Positioned(
                bottom: 0,
                child: _topTrendings())
              ]),
          ),

          _category(),
          _recent(),

          SizedBox(
            height: Get.height*.4)
    
          ],
      ),
    );
  }

  Widget _recentCards(){
    return Center(
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        spacing: 20,
        runSpacing: 20,
        children: [
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          _recentCard(),
          
        ],
      ),
    );
  }

  Widget _recent(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent",style: TextStyle(color: CustomColors.primaryblue,fontSize: 20,fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15,
          ),

          _recentCards()
          
        ],
      ),
    );
  }

  Widget _recentCard(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width*.4,
          height: Get.height*.35,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/dog.jpg",
            fit: BoxFit.fitHeight,)
          ),
        ),

        SizedBox(
          height: 15,
        ),
        Text("Toy Story",style: TextStyle(color: CustomColors.primaryblue,fontSize: 18,
        fontWeight: FontWeight.bold),)
      ],
    );
  }

  Widget _category(){
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        _head(),
        _categoryItems()
      ],
    );
  }

  Widget _head(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Category",style: TextStyle(color: CustomColors.primaryblue,fontSize: 20,fontWeight: FontWeight.bold)),

          _seeMoreBtn()
        ],
      ),
    );
  }

  Widget _seeMoreBtn(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Text("See more"),
    );
  }

  Widget _categoryItems(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _eachCategoryItem(
text: "Actions",
iconData: FontAwesomeIcons.solidHandRock
        ),
        _eachCategoryItem(
          text: "Comedy",
iconData: FontAwesomeIcons.solidLaugh
        ),
        _eachCategoryItem(
          text: "Sci-fi",
iconData: FontAwesomeIcons.robot
        ),
        _eachCategoryItem(
          text: "Romance",
iconData: FontAwesomeIcons.heart
        ),
      ],
    );
  }

  Widget _eachCategoryItem({String text, IconData iconData}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(10)),
          child: FaIcon(iconData,color: CustomColors.primaryblue,)
        ),

        Text(text,style: TextStyle(color: CustomColors.primaryblue,fontWeight: FontWeight.bold),)
      ],
    );
  }

  Widget _topTrendings(){
    return Container(
      height: Get.height*.25,
      width: Get.width,
      color: Colors.transparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            
            
          ],
        ),
      )
      
    );
  }

  

  Widget _appBar(){
    return Stack(
      children :[ Container(
        height: Get.height*.30,
        width: Get.width,
        decoration: BoxDecoration(
          color: CustomColors.primaryblue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
      ),

      Positioned(
        right: -50,
        top: -30,
              child: Container(
          height: Get.height*.3,
          width: Get.height*.3,
          decoration: BoxDecoration(
            
            color: CustomColors.lightblue,
            shape: BoxShape.circle
          ),
        ),
      ),

      Positioned(
        right: 0,
        top: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            Icon(Icons.arrow_back_ios,color: Colors.white,),
            _searchBar()
            ]),
            SizedBox(
              height: 20,
            ),
          Text("Trending",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
          ])),

      ]
    );
  }

  

  Widget _searchBar(){
    return SearchBar();
  }
}