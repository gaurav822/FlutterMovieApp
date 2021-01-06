import 'package:MovieTorrentDownloader/Custom_Widgets/movie_card.dart';
import 'package:MovieTorrentDownloader/Custom_Widgets/search_bar.dart';
import 'package:MovieTorrentDownloader/Screens/movies/moviescontroller.dart';
import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Movies extends StatelessWidget {
  Orientation orientation= Orientation.portrait;
  final MoviesController moviesController= MoviesController();

  final List<String> categoryList=["Popular","Trending","Recent","Upcoming","4k"];
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context,orientation){
        this.orientation=orientation;
        return 
        Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: CustomColors.background,
          body:orientation==Orientation.portrait
        ? _portraitView()
        : _landscapeView() ,
        );
        
      },
    );
  }

  Widget _portraitView(){
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(Get.context).padding.top,
        ),
        _appBar(),
        _body(),
      ],
    );
  }

  Widget _landscapeView(){
    return Column();
  }

  Widget _appBar(){
    return Stack(
      children :[ Container(
        height: Get.height*.20,
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
        child: _searchBar()),

      Positioned(
        bottom: 0,
        child: _categoryTabs())

      ]
    );
  }

  

  Widget _searchBar(){
    return SearchBar();
  }

  Widget _categoryTabs(){
    return GetBuilder(
        init: moviesController,
          builder:(_) =>Container(
        color: Colors.transparent,
        height: Get.height*.08,
        width: Get.width,
        child: SingleChildScrollView(

                scrollDirection: Axis.horizontal,

                  child: Row(
                  children:[
                    for(String each in categoryList) 
                    _singleTab(title: each, 
                    isSelected: moviesController.currentIndex==categoryList.indexOf(each),
                    index:categoryList.indexOf(each) )

                    // _singleTab(
                    //   title: "Popular",
                    //   isSelected: moviesController.currentIndex==0,
                    //   index: 0
                    // ),
                    // _singleTab(
                    //   title: "Trending",
                    //   isSelected: moviesController.currentIndex==1,
                    //   index: 1
                    // ),
                    // _singleTab(
                    //   title: "Recent",
                    //   isSelected: moviesController.currentIndex==2,
                    //   index: 2
                    // )
                    ] ,
          ),
        ),
      ),
    );
  }

  Widget _singleTab({@required String title, @required bool isSelected, @required int index}){

    return GestureDetector(
          onTap: (){
            moviesController.onTabClick(index);
          },
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.5),
                    padding: EdgeInsets.symmetric(horizontal: 10),
            height: 20,
            width: Get.width*.2,
            decoration: BoxDecoration(
              color: isSelected? CustomColors.orange: CustomColors.lightPurple,
              borderRadius: BorderRadius.circular(50),
            
            ),
            child: Text(title,style: TextStyle(color: Colors.white),),
          ),
    );
  }

  Widget _body(){
    return SizedBox(
      height: Get.height*.8- MediaQuery.of(Get.context).padding.top,
      width: Get.width,
      child: ListView(

        children: [
          MovieCard(),
          SizedBox(
            height: 10,
          ),
          MovieCard(),
          
          
        ],
        

      ),
    );
  }

}