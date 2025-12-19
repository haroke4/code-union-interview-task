import 'package:get_it/get_it.dart';
import 'package:stock_investment_app/features/stock/data/repos/mock_stock_repo.dart';
import 'package:stock_investment_app/features/stock/domain/repo/stock_repo.dart';

final getIt = GetIt.instance;

void setupStockFeatureDI() {
  // Repositories
  getIt.registerLazySingleton<StockRepo>(() => MockStockRepo());
}
