import 'package:stock_investment_app/core/utils/service_locator.dart';
import 'package:stock_investment_app/features/stock/data/repos/mock_stock_repo.dart';
import 'package:stock_investment_app/features/stock/domain/repo/stock_repo.dart';

void setupStockFeatureDI() {
  // Repositories
  getIt.registerLazySingleton<StockRepo>(() => MockStockRepo());
}
