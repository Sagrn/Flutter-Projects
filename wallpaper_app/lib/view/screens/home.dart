import 'package:flutter/material.dart';
import 'package:wallpaper_app/control/apicontroller.dart';
import 'package:wallpaper_app/view/screens/fullscreen.dart';
import 'package:wallpaper_app/view/widgets/categoryblock.dart';
import 'package:wallpaper_app/view/widgets/customappbar.dart';

import '../../model/photomodel.dart';
import '../widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> trendingWallpaperList = [];

  getTrendingWallpaper  () async{

    // print("getTendingWallpaperlist method is called");
    trendingWallpaperList =  await ApiOpeations.getTrendingWallpaper();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getTrendingWallpaper();
  }

  List<String> category = ["Cars","Nature","Bikes","Love","Forests","Animals","Movies","Gaming"];  //
  List<String> imgCategoryUrl  = [
    "https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1366630/pexels-photo-1366630.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1024967/pexels-photo-1024967.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/38136/pexels-photo-38136.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1366630/pexels-photo-1366630.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1413412/pexels-photo-1413412.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
          appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: Colors.white24,
            title: CustomAppBar(word1: "Wallpaper",word2: "App",),

          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-----------------Search Bar-------------------------
            Container(
              height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomSearchBar()),
            //--------------------Category Section--------------------------
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                      itemBuilder: ((context,index) => CategoryBlock(categoryList: category,index: index,categoryUrl:imgCategoryUrl))),
              ),
            ),
            //------------------List of Wallpapers---------------------------------------
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 700,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                mainAxisExtent: 400
              ),
                  itemCount: trendingWallpaperList.length,
                  itemBuilder: ((context,index) => InkWell(
                    child: Hero(
                      tag: trendingWallpaperList[index].src,
                      child: Container(
                                      height: 800,
                                      width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            trendingWallpaperList[index].src,
                            height: 800,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(imgUrl: trendingWallpaperList[index].src)));
                    },
                  )
                  )),
            )
          ],
        ),
      ),
    );
  }
}
