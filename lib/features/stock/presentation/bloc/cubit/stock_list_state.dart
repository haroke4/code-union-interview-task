part of 'stock_list_cubit.dart';

@immutable
class StockListState {
  final List<Stock> stocks;
  final bool isLoading;
  final Failure? failure;

  StockListState(
      {required this.stocks, required this.isLoading, required this.failure});
}
