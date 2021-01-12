

import 'package:MovieTorrentDownloader/api/api.dart';
import 'package:MovieTorrentDownloader/model/movie_suggestion.dart';
import 'package:MovieTorrentDownloader/screens/detailed_page/detailed_page.dart';
import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MovieTorrentDownloader/model/listmovies.dart' as listmovie;

class SearchBar extends StatelessWidget {
  final SearchBarController searchBarController = SearchBarController();
  final double searchBarWidth;
  SearchBar({@required this.searchBarWidth});
  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(100));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
              children: [
                _bar(),

                _suggestionBox()
              ],
              
      ),
    );
  }

 

  Widget _suggestionBox(){
    
    return GetBuilder(
      init: searchBarController,
          builder:(_)=>  searchBarController.query.isEmpty? SizedBox():Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(top: 10),
        width: searchBarWidth,
        height: Get.height*.4,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(2,2),
              blurRadius: 3,
              spreadRadius: 1
            )
          ],
          borderRadius: BorderRadius.circular(18)
        ),
        child: SingleChildScrollView(
                child: Column(
            children: [
              for(var each in searchBarController.suggestionList)  _eachSuggestionCard(each)
            ],
          ),
        ),
      
      ),
    );
  }

   Widget _eachSuggestionCard(Movie movie){
    return GestureDetector(
      onTap: (){
        searchBarController.hideSuggestionBox();
        Get.to(DetailedPage(listmovie.Movie.fromJson(movie.toJson())));
      },
          child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10),
        width: searchBarWidth,
        height: Get.height*.15,
        color: Colors.white,
        child: Row(
          children: [
            _movieCover(movie.mediumCoverImage),
            SizedBox(
              width: 10,
            ),
            _title(movie.titleEnglish)
          ],
        ),
      ),
    );
  }

  Widget _movieCover(String url){
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(url,
      width: Get.width*.15,
      height: Get.height*.12,
      fit: BoxFit.fitHeight,
      ),
      
      
    );
  }

  Widget _title(String title){
    return Text(title);
  }

  Widget _bar(){

    return SizedBox(
          width: searchBarWidth,
          child: TextField(
            onChanged: (value){
              searchBarController.onChanged(value);
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.background,
                // contentPadding: EdgeInsets.only(left:20),
                isDense: true, 
                hintText: "Type something",
                focusedBorder: border,
                enabledBorder: border),
          ),
        );
  }
}

class SearchBarController extends GetxController{
  String query= '';

  List<Movie> suggestionList = List();

  onChanged(String val){
    query=val;
    update();
    _getMovieSuggestion();
  }

  _getMovieSuggestion()async{
    MovieSuggestion suggestions = await Api.searchMovies(queryTerm: query);
    List<Movie> movies= suggestions.data.movies;
    suggestionList=movies;
    update();

  }

  hideSuggestionBox(){
    query="";
    update();
  }


  getSuggestionList(){

  }

}
