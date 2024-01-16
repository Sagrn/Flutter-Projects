import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widgets/categoryblock.dart';
import 'package:wallpaper_app/view/widgets/customappbar.dart';
import '../../control/apicontroller.dart';
import '../../model/photomodel.dart';
import '../widgets/searchbar.dart';
import 'fullscreen.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key,required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
   List<PhotoModel> searchedWallpaperList  = [];

  getSearchedWallpaper() async {
    // print("GetSearched wallpaper meythod is called .........");
    searchedWallpaperList = await ApiOpeations.getSearchedWallpaper(widget.query);
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchedWallpaper();
    // print(searchedWallpaperList);
  }
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
            SizedBox(
              height: 10,
            ),
             //------------------List of Wallpapers---------------------------------------
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      mainAxisExtent: 400
                  ),
                  itemCount: searchedWallpaperList.length,
                  itemBuilder: ((context,index) => InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(imgUrl: searchedWallpaperList[index].src)));
                    },
                    child: Hero(
                      tag: searchedWallpaperList[index].src,
                      child: Container(
                        height: 800,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            searchedWallpaperList[index].src,
                            height: 800,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
