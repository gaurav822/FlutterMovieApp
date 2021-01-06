import 'package:MovieTorrentDownloader/Screens/movies/movies.dart';
import 'package:MovieTorrentDownloader/Screens/trending/trending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  int navBarIndex=0;

  navBarItemTap(int index){
    navBarIndex=index;
    update();
  }

  List<Widget> _homePages = [Movies(),Trending()];

  Widget get homePage => _homePages[navBarIndex];
}