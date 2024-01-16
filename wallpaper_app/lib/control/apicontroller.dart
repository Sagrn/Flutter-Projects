import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/photomodel.dart';

class ApiOpeations{
  static List<PhotoModel> trendingWallpaper = [];
  static List<PhotoModel> searchedWallpaper = [];

  // /----------------------------
 static Future<List<PhotoModel>> getTrendingWallpaper () async {

   // print("API Method ............");

    await http.get(
      Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {"Authorization" : "UuVFdKbElJ7MEq18baBcUGkJBU9SlD69IS2uHoo5hQsITEE6i34p7o7G"}
    ).then((value){

       // print(value.body);

      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        // print(element);
        trendingWallpaper.add(PhotoModel.fromApi2App(element));
        // print(PhotoModel.fromApi2App(element));
      });
    });
    // print("Api method is called");
    return trendingWallpaper;
  }


  //----------Search wallpaper method-------------
  static Future<List<PhotoModel>> getSearchedWallpaper (String query) async {

    // print("API Method  getSearchedWallpaperr is called  .. ............");

    await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=80&page=1"),
        headers: {"Authorization" : "UuVFdKbElJ7MEq18baBcUGkJBU9SlD69IS2uHoo5hQsITEE6i34p7o7G"}
    ).then((value){

       // print("data is : "+value.body);

      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchedWallpaper.clear();

      photos.forEach((element) {
        // print(element);
        searchedWallpaper.add(PhotoModel.fromApi2App(element));
        // print(PhotoModel.fromApi2App(element));
      });
    });
    // print("Api method is called");
    return searchedWallpaper;
  }

}