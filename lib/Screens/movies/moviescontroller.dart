import 'package:MovieTorrentDownloader/Custom_Widgets/movie_card.dart';
import 'package:MovieTorrentDownloader/Model/listmovies.dart';
import 'package:MovieTorrentDownloader/api/api.dart';
import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController{

  MoviesController(){
    _getMovieList();
  }

  List<Widget> _movieList = [
    Center(
      child: CircularProgressIndicator(),
    )
  ];

  List<Widget> get movieList => _movieList;

  Color selectedTabColor = CustomColors.orange;
  Color unselectedTabColor= CustomColors.lightPurple;

  int currentIndex=0;

  onTabClick(int index){
    currentIndex= index;
    update();
  }

  _getMovieList()async{
    ListMovies listMovies =await Api.listMovies();

    List<Widget> _tempList= List();

    for(var eachMovie in listMovies.data.movies){

      _tempList.add(MovieCard(eachMovie));
    }

    _movieList = _tempList;
    update();
    
  }
}