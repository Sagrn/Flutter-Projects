import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = ""; //   . 0 - 9
  String operand = ""; //  + - * /
  String number3 = ""; //   . 0 - 9
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            //Output Section
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  // color: Colors.orange,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(16),
                    child: Text("$number1$operand$number3".isEmpty ? " " : "$number1$operand$number3",
                      style: const TextStyle(fontSize: 48,fontWeight: FontWeight.bold),textAlign: TextAlign.end,)
                ),
              ),
            ),

            //Buttons Section

            Wrap(
              children: Btn.buttonValues.map((value) => SizedBox(
                  height: screenSize.height/7,
                  width: value == Btn.n0 ? screenSize.width/2 : (screenSize.width/4),
                  child: buildButton(value))).toList(),
            )

          ],
        ),
      ),
    );
  }

  //###################
  Widget buildButton(String value) {
return Padding(
  padding: const EdgeInsets.all(4.0),
  child: Material(
    color: getBtnColor(value),
    clipBehavior: Clip.hardEdge,
    shape: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white24
      ),
      borderRadius: BorderRadius.circular(100)
    ),
    child: InkWell(
        onTap: () => onBtntap(value),
        child: Center(
            child: Text(value,style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),))),
  ),
);
  }



  // ######################
  Color getBtnColor(String value) {
    return [Btn.del,Btn.clr].contains(value)?
          Colors.blueGrey :
            [Btn.per,Btn.multiply,Btn.add,Btn.subtract,Btn.divide,Btn.calculate].contains(value) ?
            Colors.orange : Colors.black87;
  }
//#########################
  void onBtntap(value) {
    if(value == Btn.del){
      delete();
      return;
    }
    if(value == Btn.clr){
      clearAll();
      return;
    }
    if(value == Btn.per){
      convertTopercentage();
      return;
    }
    if(value == Btn.calculate){
      calculate();
      return;
    }
   appendValue(value);
  }
  //###############
  void calculate(){
    if(number1.isEmpty) return;
    if(number3.isEmpty) return;
    if(operand.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num3 = double.parse(number3);

    var result = 0.0;

    switch(operand){
      case Btn.add:result = num1 + num3 ; break;
      case Btn.subtract:result = num1 - num3 ; break;
      case Btn.multiply:result = num1 * num3 ; break;
      case Btn.divide:result = num1 / num3 ; break;
      default:
    }
    setState(() {
      number1 = "$result";

      if(number1.endsWith(".0")){
        number1 = number1.substring(0,number1.length  -2);
      }

      operand = "";
      number3 = "";
    });
  }
  //###############
  void convertTopercentage(){
    if(number1.isNotEmpty && number3.isNotEmpty && operand.isNotEmpty){
      calculate();
    }
    if(operand.isNotEmpty){
      return;
    }
    final number = double.parse(number1);
    setState(() {
      number1 = "${(number/100)}";
      operand = "";
      number3 = "";
    });
  }
////#############
  void clearAll() {
    setState(() {
      number1 = "";
      operand = "";
      number3 = "";
    });
  }
  //#########
  void delete(){
    if(number3.isNotEmpty){
      number3 = number3.substring(0,number3.length-1);
    }else if(operand.isNotEmpty){
      operand = "";
    }else if(number1.isNotEmpty){
      number1 = number1.substring(0,number1.length-1);
    }
    setState(() {

    });
  }


  //###################
  void appendValue(String value){
    if(value!=Btn.dot && int.tryParse(value)==null){
      //
      if(operand.isNotEmpty && number3.isNotEmpty){
        //TODO calculate the equation before assigning new
        calculate();
      }
      operand = value;
    } else if(number1.isEmpty || operand.isEmpty){
      if(value==Btn.dot && number1.contains(Btn.dot)) return;
      if(value ==Btn.dot && (number1.isEmpty || number1==Btn.n0)){
        value = "0.";
      }
      number1 =number1 + value;
    }else if(number3.isEmpty || operand.isNotEmpty){
      if(value==Btn.dot && number3.contains(Btn.dot)) return;
      if(value ==Btn.dot && (number3.isEmpty || number3==Btn.n0)){
        value = "0.";
      }
      number3 = number3 + value;
    }
    setState(() {

    });
  }


}
