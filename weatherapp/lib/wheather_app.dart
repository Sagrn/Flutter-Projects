import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/add_info_items.dart';
import 'package:weatherapp/hourly_forecast_items.dart';
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {


Future<Map<String,dynamic>> getWeatherData() async {
  try{
    //For delhi
   String Latitude = "28.6139";
   String Longitude = "77.2090";
   String APIkey = "84c35543c70c60493cdb16ec475d37c7";
   final res = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?lat=$Latitude&lon=$Longitude&appid=$APIkey"));
    
    final data = jsonDecode(res.body);
    if(data['cod'] != "200"){
  throw ("An unexpected error occured");
    }
    return data;
  }catch(e){
    throw e.toString();
  }
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    late String Location;

    return Scaffold(
      appBar: AppBar(
        leading: Center(child: Text("New Delhi")),
        title: const Text("Weather App",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              
            });
                // print("Refresh");
          }, icon: const Icon(Icons.refresh))
        ],),
        body:   FutureBuilder(
          future:getWeatherData(),
          builder:(context,snapshot) {
            
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: const CircularProgressIndicator());
            }

            if(snapshot.hasError){
              return Center(child:Text(snapshot.error.toString()));
            }
        
          // print(snapshot);
          // print('------------------------');
          // print(snapshot.data);

          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];

          Location = data['city']['name'];

          print(Location);

          // print(currentTemp);


            return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Main First Card 
                SizedBox(
                  width: double.infinity,
                  child:Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(30) ,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8,sigmaY: 8),
                        child:  Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(currentTemp.toString(),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400),),
                              SizedBox(height:10),
                              Icon( currentSky == "Clouds"||currentSky=="Rain" ? Icons.cloud : Icons.sunny ,  size: 50,),
                              SizedBox(height:10),
                              Text(currentSky,style: TextStyle(fontSize: 25),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                const SizedBox( height: 16,),
                const Text("Weather Forecast",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                const SizedBox(height: 10,),
                  // SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for(int i=0;i<15;i++) 
                //       HourlyForecastItems(
                //         time: data['list'][i+1]['dt'].toString(),
                //         icon:  data['list'][i+1]['weather'][0]['main']=="Clouds" || data['list'][i+1]['weather'][0]['main']=="Rain" ? Icons.cloud : Icons.sunny,
                //         temp: data['list'][i+1]['main']['temp']
                //       ),
                //       // HourlyForecastItems(
                //       //    time: "03:00",
                //       //   icon: Icons.sunny,
                //       //   temp: 301.1
                //       // ),
                //       // HourlyForecastItems(
                //       //    time: "06:00",
                //       //   icon: Icons.wind_power_outlined,
                //       //   temp: 300.85
                //       // ),
                //       // HourlyForecastItems(
                //       //    time: "09:00",
                //       //   icon: Icons.water_rounded,
                //       //   temp: 301.1
                //       // ),
                //       // HourlyForecastItems(
                //       //    time: "12:00",
                //       //   icon: Icons.cloud,
                //       //   temp: 300.5
                //       // ),
                //     ],
                //   ),
                // )

                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context,index) {
                      final hourlyForecast = data['list'][index+1];

                      final time = DateTime.parse(hourlyForecast['dt_txt']);
                    
                      return HourlyForecastItems(
                        time:DateFormat.j().format(time),
                        icon: hourlyForecast['weather'][0]['main']=="Clouds" || data['list'][index+1]['weather'][0]['main']=="Rain" ? Icons.cloud : Icons.sunny,
                        temp: hourlyForecast['main']['temp'],
                      );
                    }),
                  ),
                
                   const SizedBox(height: 16,),
                   const Text("Additional Information",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                   const SizedBox(height: 14,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                          AdditionalInfo(
                            icon: Icons.water_drop,
                            condition: "Humidity",
                            value: currentHumidity.toString(),
                          ),
                          AdditionalInfo(
                             icon: Icons.air,
                            condition: "Wind Speed",
                            value: currentWindSpeed.toString(),
                          ),
                          AdditionalInfo(
                             icon: Icons.umbrella_rounded,
                            condition: "Pressure",
                            value: currentPressure.toString(),
                          )
          
                    ],
                   )
                  
              ]
              ),
          );
          },
        ),
    );
  }
}