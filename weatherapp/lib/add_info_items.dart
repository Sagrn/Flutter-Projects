import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String condition;
  final String value;
  const AdditionalInfo({
    super.key,
    required this.icon,
    required this.condition,
    required this.value,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                          width: 100,
                          child:Column(
                            children: [
                              Icon(icon,size: 30,),
                              const SizedBox(height: 10,),
                              Text(condition,style: const TextStyle(fontSize: 18),),
                              const SizedBox(height: 10,),
                              Text(value,style: const TextStyle(fontSize: 16))
                            ],)
                        );
  }
}