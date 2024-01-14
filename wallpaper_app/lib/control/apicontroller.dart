import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiOpeations{

 static getTrendingWallpaper () async {

    await http.get(
      Uri.parse("https://api.pexels.com/v1/curated"),
      headers: {"Authorization" : "UuVFdKbElJ7MEq18baBcUGkJBU9SlD69IS2uHoo5hQsITEE6i34p7o7G"}
    ).then((value){

      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        Map<String,dynamic> src = element["src"];
        print(src["portrait"]);
      });
    });
  }
}