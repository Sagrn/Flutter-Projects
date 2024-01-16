
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';


class FullScreen extends StatelessWidget {
  String imgUrl;
  FullScreen({super.key,required this.imgUrl});

  final snackBar = SnackBar(
    content: Text('Wallpaper is Successfuly set'),
  );

Future<void> setWallpaper (BuildContext context) async {
  try {
    int location = WallpaperManager.BOTH_SCREEN;
    final file = await DefaultCacheManager().getSingleFile(imgUrl);
    bool result = await WallpaperManager.setWallpaperFromFile(
        file.path, location);
    print("What you gave : ----------------------------");
    print(file.path);
  } catch (e){
    print("Error is ----------- $e ---------------------------" );
  }
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

}
  // FullScreenDownload obj = FullScreenDownload(imgurl: imgUrl,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: ElevatedButton(
        onPressed: () {
          setWallpaper(context);
        },
        child: Text("Set Wallpaper"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover
          )
        ),

      ),
    );
  }
}
