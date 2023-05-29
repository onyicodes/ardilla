import 'package:equatable/equatable.dart';

class CarouselEntity extends Equatable {
  const CarouselEntity({
    required this.title,
    required this.change,
    required this.currency,
    required this.image,
    required this.amount,
    required this.exchangeFrom,
    required this.exchangeRate,
    required this.exchangeTo
  });

  final String image;
  final String title;
  final String change;
  final String currency;
  final int amount;
  final String exchangeFrom;
  final String exchangeTo;
  final int exchangeRate;

  @override
  List<Object?> get props => [
        image,
      ];
}
