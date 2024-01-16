import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widgets/categoryblock.dart';
import 'package:wallpaper_app/view/widgets/customappbar.dart';

import '../../control/apicontroller.dart';
import '../../model/photomodel.dart';


class CategoryScreen extends StatefulWidget {

 const CategoryScreen({super.key});


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {




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

            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Stack(
            //     children : [ Image.network(
            //       "https://images.pexels.com/photos/1784578/pexels-photo-1784578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            //       height: 150,
            //       width: MediaQuery.of(context).size.width,
            //       fit: BoxFit.cover,
            //     ),
            //       Container(
            //         height: 150,
            //         width: MediaQuery.of(context).size.width,
            //         color: Colors.black26,
            //       ),
            //       Positioned(
            //         top: 40,
            //         left: 130,
            //         child: Column(
            //           children: [
            //             Text("Category",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w300),),
            //             Text("Oceans",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500),),
            //
            //           ],
            //         ),
            //       )
            //
            //     ]
            //   ),
            // ),
            SizedBox(height: 10,),
            //-----------------Search Bar-------------------------

            //--------------------Category Section--------------------------

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
                  itemCount: 5,
                  itemBuilder: ((context,index) => Container(
                    height: 800,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "hhtp",
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
