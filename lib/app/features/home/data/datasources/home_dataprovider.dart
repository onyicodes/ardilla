import 'dart:convert';

import 'package:ardilla/app/features/home/data/model/carousel_model.dart';
import 'package:ardilla/app/features/home/data/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';

abstract class HomeDataProvider extends GetConnect {
  Future<List<CarouselModel>> fetchCarousel();
  Future<List<CategoryModel>> fetchCategories();
}

class HomeDataProviderImpl extends HomeDataProvider {
  HomeDataProviderImpl();
  // Get request

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final String response = await rootBundle
        .loadString('assets/json_contents/categories.json');

    final List<dynamic> jsonStringContentList;
    jsonStringContentList = jsonDecode(response);

    return jsonStringContentList
        .map((categoryJson) => CategoryModel.fromMap(categoryJson))
        .toList();
  }

  @override
  Future<List<CarouselModel>> fetchCarousel() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/carousel.json');

    final List<dynamic> carouselJsonList;
    carouselJsonList = jsonDecode(response);

    return carouselJsonList
        .map((carouselJson) => CarouselModel.fromMap(carouselJson))
        .toList();
  }
}
