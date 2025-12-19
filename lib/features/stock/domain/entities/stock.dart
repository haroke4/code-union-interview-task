import 'package:stock_investment_app/features/stock/domain/entities/country.dart';

class Stock {
  final String id;
  final String stockName;
  final String companyName;
  final String logo;
  final DateTime? updatedAt;
  final bool isCompliant;

  final double priceInUsd;
  final double priceChangeInPercent;

  final Country country;

  Stock(
      {required this.id,
      required this.stockName,
      required this.companyName,
      required this.logo,
      required this.updatedAt,
      required this.isCompliant,
      required this.priceInUsd,
      required this.priceChangeInPercent,
      required this.country}); // from 0 to 1, can be negative
}
