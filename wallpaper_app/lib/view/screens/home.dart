import 'package:flutter/material.dart';
import 'package:wallpaper_app/control/apicontroller.dart';
import 'package:wallpaper_app/view/widgets/categoryblock.dart';
import 'package:wallpaper_app/view/widgets/customappbar.dart';

import '../widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiOpeations.getTrendingWallpaper();
    print("Helllooooooo");
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                    itemBuilder: ((context,index) => CategoryBlock())),
              ),
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
                  itemCount: 10,
                  itemBuilder: ((context,index) => Container(
                height: 800,
                width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://images.pexels.com/photos/1366913/pexels-photo-1366913.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        height: 800,
                        width: 100,
                        fit: BoxFit.cover,
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
