// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_using_provider/Dio/dio_services.dart';
import 'package:weather_app_using_provider/Model/model.dart';
import 'package:weather_app_using_provider/search_bar.dart';
// import 'package:weather_app_using_provider/temperature.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioService>((context), listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text("Weather App💙"),
        backgroundColor: Color(0xff1B2541),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<WeatherModel>(
          future: state.currentWeather(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final double temperatue = snapshot.data!.main!.temp! - 273.15;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    SearchBar(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 490,
                      width: double.infinity,
                      color: Color(0xff1B2541),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "📍 ${snapshot.data!.name}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              "assets/images/sunny.png",
                            ),
                          ),
                          Center(
                            child: Text(
                              temperatue.toString().substring(0,2),
                              style: TextStyle(
                                fontSize: 72,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              snapshot.data!.weather!.first.description.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/wind.png",
                                      height: 32,
                                      width: 32,
                                      color: Colors.white,
                                    ),
                                    Text(
                                     "${ snapshot.data!.wind!.speed!.toString()} km/h",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/rain.png",
                                      height: 32,
                                      width: 32,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      snapshot.data!.sys!.country.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "assets/images/humid.png",
                                      height: 32,
                                      width: 32,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${snapshot.data!.main!.humidity.toString()}%",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Powered by Farhan👋",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          })),
    );
  }
}




// SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         snapshot.data!.wind!.speed!.toString(),
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                             fontSize: 24),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "% Rain Perception☔",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         snapshot.data!.timezone.toString(),
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                             fontSize: 20),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Time Zone",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   )
                