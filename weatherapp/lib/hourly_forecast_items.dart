
import 'package:flutter/material.dart';

class HourlyForecastItems extends StatelessWidget {
  final String time ;
  final IconData icon;
  final double temp;
  const HourlyForecastItems({
    super.key,
    required this.time,
    required this.icon,
    required this.temp
    });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  width: 100,
                  child: Card(
                    elevation: 8,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(time,
                          style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10,),
                          Icon(icon),
                          const SizedBox(height: 10,),
                          Text("$temp"),
                      ],),
                    )
                  ),
                );
  }
}