import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static var  winnerColor = Colors.amberAccent;
  static var normalColor = Colors.deepOrange;
bool oTurn = true;
List DisplayXo = ["","","","","","","","",""];
String resultDeclaration ="";
int xScore = 0;
int oScore = 0;
int fillBoxes = 0;
bool winnerFind = false;
List winnerList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
     body:Padding(
       padding: const EdgeInsets.all(20),
       child: Column(
         children: [
           Expanded(
               flex: 1,
               child: Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text("Player X",style:GoogleFonts.coiny(textStyle: TextStyle(fontSize: 30,color: Colors.white) ,)),
                         Text(xScore.toString(),style:GoogleFonts.coiny(textStyle: TextStyle(fontSize: 30,color: Colors.white) ,))
                       ],
                     ),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text("Player O",style:GoogleFonts.coiny(textStyle: TextStyle(fontSize: 30,color: Colors.white) ,)),
                         Text(oScore.toString(),style:GoogleFonts.coiny(textStyle: TextStyle(fontSize: 30,color: Colors.white) ,))
                       ],
                     )
                   ],
                 ),
               )),


           Expanded(
               flex: 3,
               child: GridView.builder(
                 itemCount: 9,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 3
               ),
                   itemBuilder: (BuildContext context,int index){
                 return GestureDetector(
                   onTap: (){
                     _onTapped(index);
                   },
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.amberAccent,
                       borderRadius: BorderRadius.circular(15),
                       border: Border.all(
                         color: normalColor,
                         width: 5
                       )
                     ),
                     child: Center(
                       child: Text(
                         DisplayXo[index],
                         style: GoogleFonts.coiny(textStyle: TextStyle(fontSize: 64,color: Colors.deepOrange)),),
                     ),
                   ),
                 );
                   })
           ),
           Expanded(
               flex: 2,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text(resultDeclaration,style:GoogleFonts.coiny(textStyle: TextStyle(fontSize: 30,color: Colors.white) ,)),
                   SizedBox(
                     height: 10,
                   ),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.white,
                         padding: EdgeInsets.symmetric(horizontal: 30,vertical: 12)
                       ),
                       onPressed: (){
                           _clearBoard();
                   }
                   , child: Text("Play Again ",style: TextStyle(fontSize: 20,color: Colors.deepOrange,fontWeight: FontWeight.w600),)),
                   SizedBox(
                     height: 20,
                   )
                 ],
               ),
           )

         ]
       ),
     )

    );
  }
  void _onTapped(int index){
    setState(() {
      if(oTurn && DisplayXo[index]==""){
        DisplayXo[index] = "O";
      }else if(!oTurn && DisplayXo[index]==""){
        DisplayXo[index] ="X";
      }
      oTurn = !oTurn;
      _checkedWinner();

    });
  }

  void _checkedWinner(){

    fillBoxes++;

    if(DisplayXo[0] == DisplayXo[1] && DisplayXo[0] == DisplayXo[2] && DisplayXo[0] != ""){
       setState(() {
         resultDeclaration = "Player "+DisplayXo[0]+" Wins!";
         _updateScore(DisplayXo[0]);
         winnerList.add(DisplayXo[0]);
         winnerList.add(DisplayXo[1]);
         winnerList.add(DisplayXo[2]);
         again();
       });
    } else if(DisplayXo[3] == DisplayXo[4] && DisplayXo[3] == DisplayXo[5] && DisplayXo[3] != ""){
      setState(() {
        resultDeclaration = "Player "+DisplayXo[3]+" Wins!";
        _updateScore(DisplayXo[3]);
        again();
      });
    }else if(DisplayXo[6] == DisplayXo[7] && DisplayXo[6] == DisplayXo[8] && DisplayXo[6] != ""){
      setState(() {
        resultDeclaration = "Player "+DisplayXo[6]+" Wins!";
        _updateScore(DisplayXo[6]);
        again();
      });
    }else if(DisplayXo[0] == DisplayXo[3] && DisplayXo[0] == DisplayXo[6] && DisplayXo[0] != "") {
      setState(() {
        resultDeclaration = "Player " + DisplayXo[0] + " Wins!";
        _updateScore(DisplayXo[0]);
        again();
      });
    }else if(DisplayXo[1] == DisplayXo[4] && DisplayXo[1] == DisplayXo[7] && DisplayXo[1] != ""){
      setState(() {
        resultDeclaration = "Player "+DisplayXo[1]+" Wins!";
        _updateScore(DisplayXo[1]);
        again();
      });
    }else if(DisplayXo[2] == DisplayXo[5] && DisplayXo[2] == DisplayXo[8] && DisplayXo[2] != ""){
      setState(() {
        resultDeclaration = "Player "+DisplayXo[2]+" Wins!";
        _updateScore(DisplayXo[2]);
        again();
      });
    }else if(DisplayXo[0] == DisplayXo[4] && DisplayXo[0] == DisplayXo[8] && DisplayXo[0] != ""){
      setState(() {
        resultDeclaration = "Player "+DisplayXo[0]+" Wins!";
        _updateScore(DisplayXo[0]);
        again();
      });
    }else if(DisplayXo[2] == DisplayXo[4] && DisplayXo[2] == DisplayXo[2] && DisplayXo[6] != ""){
      setState(() {
        resultDeclaration = "Player "+DisplayXo[2]+" Wins!";
        _updateScore(DisplayXo[2]);
        again();
      });
    }

    if(!winnerFind && fillBoxes ==9){
      setState(() {
        resultDeclaration = "Nobody Wins!!";
      });
    }


  }

  void _updateScore(String winner){
    if(winner == "O"){
      oScore++;
    }else if(winner == "X"){
      xScore++;
    }
    winnerFind = true;
  }

void _clearBoard(){
    setState(() {
      for(int i=0; i<9; i++){
        DisplayXo[i] = "";
      }
      resultDeclaration = "";
      xScore = 0;
      oScore = 0;
    });
    fillBoxes = 0;
}
void again() {

    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        for(int i=0; i<9; i++){
          DisplayXo[i] = "";
        }
        resultDeclaration = "";
        // normalColor = Colors.lightGreen;
      });
      fillBoxes = 0;
      oTurn = true;
    }
    );
}
//Main
}
