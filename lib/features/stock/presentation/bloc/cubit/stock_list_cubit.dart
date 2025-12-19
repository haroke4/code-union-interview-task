import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_investment_app/core/domain/result.dart';
import 'package:stock_investment_app/features/stock/domain/entities/stock.dart';
import 'package:stock_investment_app/features/stock/domain/repo/stock_repo.dart';

part 'stock_list_state.dart';

class StockListCubit extends Cubit<StockListState> {
  StockListCubit(this._stockRepo)
      : super(
            StockListState(stocks: const [], isLoading: false, failure: null));

  final StockRepo _stockRepo;

  Future<void> getStocks() async {
    emit(StockListState(stocks: [], isLoading: true, failure: state.failure));
    final result = await _stockRepo.getStocks(
      query: null,
      isCompliant: null,
    );
    result.match(
      ok: (stocks) =>
          emit(StockListState(stocks: stocks, isLoading: false, failure: null)),
      err: (failure) => emit(
          StockListState(stocks: const [], isLoading: false, failure: failure)),
    );
  }
}
