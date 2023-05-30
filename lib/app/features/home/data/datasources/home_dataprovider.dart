import 'dart:convert';

import 'package:ardilla/app/features/home/data/model/benefits_model.dart';
import 'package:ardilla/app/features/home/data/model/carousel_model.dart';
import 'package:ardilla/app/features/home/data/model/cash_flow_model.dart';
import 'package:ardilla/app/features/home/data/model/category_model.dart';
import 'package:ardilla/app/features/home/data/model/rank_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';

abstract class HomeDataProvider extends GetConnect {
  Future<List<CarouselModel>> fetchCarousel();
  Future<List<CategoryModel>> fetchCategories();
  Future<CashFlowModel> fetchCashFlows();
  Future<List<BenefitsModel>> fetchBenefits();
  Future<List<RankModel>> fetchRanks();
}

class HomeDataProviderImpl extends HomeDataProvider {
  HomeDataProviderImpl();
  // Get request

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/categories.json');

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

  @override
  Future<CashFlowModel> fetchCashFlows() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/cash_flow.json');

    final Map<String, dynamic> cashFlowJson;
    cashFlowJson = jsonDecode(response);
    print(cashFlowJson);

    return CashFlowModel.fromMap(cashFlowJson);
  }

  @override
  Future<List<BenefitsModel>> fetchBenefits() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/benefits.json');

    final List<dynamic> benefitJson;
    benefitJson = jsonDecode(response);

    return benefitJson
        .map((carouselJson) => BenefitsModel.fromMap(carouselJson))
        .toList();
  }


  @override
  Future<List<RankModel>> fetchRanks() async {
    final String response =
        await rootBundle.loadString('assets/json_contents/ranks.json');

    final List<dynamic> ranksListJson;
    ranksListJson = jsonDecode(response);

    return ranksListJson
        .map((carouselJson) => RankModel.fromMap(carouselJson))
        .toList();
  }
}
