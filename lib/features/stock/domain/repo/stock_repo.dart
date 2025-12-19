import 'package:stock_investment_app/core/domain/result.dart';
import 'package:stock_investment_app/features/stock/domain/entities/country.dart';
import 'package:stock_investment_app/features/stock/domain/entities/stock.dart';

abstract class StockRepo {
  Future<Result<List<Stock>>> getStocks({
    required String? query,
    required bool? isCompliant,
  });
}
