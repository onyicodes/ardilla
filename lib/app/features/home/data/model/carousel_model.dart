// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ardilla/app/features/home/domain/entities/carousel_entity.dart';

class CarouselModel extends CarouselEntity {
  final String image;
  final String title;
  final String change;
  final String currency;
  final int amount;
  final String exchangeFrom;
  final String exchangeTo;
  final int exchangeRate;
 

  const CarouselModel({
    required this.title,
    required this.change,
    required this.currency,
    required this.image,
    required this.amount,
    required this.exchangeFrom,
    required this.exchangeRate,
    required this.exchangeTo
  }) : super(image: image, title: title, change: change, currency: currency,
  amount: amount, exchangeFrom: exchangeFrom,exchangeRate: exchangeRate, exchangeTo: exchangeTo);

  factory CarouselModel.fromMap(Map<String, dynamic> json) => CarouselModel(
      image: json["image"],
      title: json["title"],
      change: json["change"],
      currency: json["currency"],
      amount: json["amount"],
      exchangeFrom: json["exchangeFrom"],
      exchangeRate: json["exchangeRate"],
      exchangeTo: json["exchangeTo"],
      );
      

  Map<String, dynamic> toMap() => {"title": title, "image": image,
  "change":change, "currency":currency, "amount":amount, "exchangeFrom": exchangeFrom, 
  "exchangeRate":exchangeRate, "exchangeTo": exchangeTo};
}
