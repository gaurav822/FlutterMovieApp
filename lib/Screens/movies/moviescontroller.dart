import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController{

  Color selectedTabColor = CustomColors.orange;
  Color unselectedTabColor= CustomColors.lightPurple;

  int currentIndex=0;

  onTabClick(int index){
    currentIndex= index;
    update();
  }
}