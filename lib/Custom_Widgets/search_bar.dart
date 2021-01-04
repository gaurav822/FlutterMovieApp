import 'package:MovieTorrentDownloader/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final border= OutlineInputBorder(
            borderRadius: BorderRadius.circular(100)
          );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: SizedBox(
        width: Get.width*0.8,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.background,
            focusedBorder: border,
            isDense: true,
            enabledBorder: border,
            hintText: "Type Something"

          ),
        ),
      ),
    );
  }
}