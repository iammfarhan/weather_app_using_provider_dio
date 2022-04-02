// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_using_provider/Dio/dio_services.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioService>(context, listen: true);
    return Consumer<DioService>(
      builder: (context, DioService, child) {
        return TextField(
          controller: DioService.searchBar,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Seacrh City👋",
            hintStyle: const TextStyle(fontSize: 15, color: Colors.white),
            prefixIcon: Icon(Icons.search),
            iconColor: Colors.white,
            filled: true,
            // fillColor: Color(0xff1B1D25),
            fillColor: Color(0xff1B2541),
          ),
          onTap: () {
            if (DioService.searchBar.text.isNotEmpty) {
              state.searchCityName(DioService.searchBar.text);
            }
          },
        );
      },
    );
  }
}
