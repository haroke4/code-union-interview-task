import 'package:stock_investment_app/core/domain/result.dart';
import 'package:stock_investment_app/features/stock/domain/entities/country.dart';
import 'package:stock_investment_app/features/stock/domain/entities/stock.dart';
import 'package:stock_investment_app/features/stock/domain/repo/stock_repo.dart';

class MockStockRepo implements StockRepo {
  final List<Stock> _mockStocks = [
    Stock(
      id: '1',
      stockName: 'AAPL',
      companyName: 'Apple Inc.',
      logo: 'https://logo.clearbit.com/apple.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 5)),
      isCompliant: true,
      priceInUsd: 178.45,
      priceChangeInPercent: 2.35,
      country: Country(
        id: 'US',
        name: 'United States',
        imagePath: 'assets/images/countries/US.png',
      ),
    ),
    Stock(
      id: '2',
      stockName: 'GOOGL',
      companyName: 'Alphabet Inc.',
      logo: 'https://logo.clearbit.com/google.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 3)),
      isCompliant: true,
      priceInUsd: 139.82,
      priceChangeInPercent: 1.87,
      country: Country(
        id: 'US',
        name: 'United States',
        imagePath: 'assets/images/countries/US.png',
      ),
    ),
    Stock(
      id: '3',
      stockName: 'MSFT',
      companyName: 'Microsoft Corporation',
      logo: 'https://logo.clearbit.com/microsoft.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 8)),
      isCompliant: true,
      priceInUsd: 378.91,
      priceChangeInPercent: -0.52,
      country: Country(
        id: 'US',
        name: 'United States',
        imagePath: 'assets/images/countries/US.png',
      ),
    ),
    Stock(
      id: '4',
      stockName: 'TSLA',
      companyName: 'Tesla, Inc.',
      logo: 'https://logo.clearbit.com/tesla.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 2)),
      isCompliant: false,
      priceInUsd: 242.84,
      priceChangeInPercent: -3.21,
      country: Country(
        id: 'US',
        name: 'United States',
        imagePath: 'assets/images/countries/US.png',
      ),
    ),
    Stock(
      id: '5',
      stockName: 'BABA',
      companyName: 'Alibaba Group',
      logo: 'https://logo.clearbit.com/alibaba.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 10)),
      isCompliant: false,
      priceInUsd: 78.32,
      priceChangeInPercent: 4.12,
      country: Country(
        id: 'CN',
        name: 'China',
        imagePath: 'assets/images/countries/CN.png',
      ),
    ),
    Stock(
      id: '6',
      stockName: 'NESN',
      companyName: 'Nestlé S.A.',
      logo: 'https://logo.clearbit.com/nestle.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 15)),
      isCompliant: true,
      priceInUsd: 112.45,
      priceChangeInPercent: 0.78,
      country: Country(
        id: 'CH',
        name: 'Switzerland',
        imagePath: 'assets/images/countries/CH.png',
      ),
    ),
    Stock(
      id: '7',
      stockName: 'ASML',
      companyName: 'ASML Holding N.V.',
      logo: 'https://logo.clearbit.com/asml.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 7)),
      isCompliant: true,
      priceInUsd: 689.23,
      priceChangeInPercent: 1.45,
      country: Country(
        id: 'NL',
        name: 'Netherlands',
        imagePath: 'assets/images/countries/NL.png',
      ),
    ),
    Stock(
      id: '8',
      stockName: 'SHOP',
      companyName: 'Shopify Inc.',
      logo: 'https://logo.clearbit.com/shopify.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 12)),
      isCompliant: true,
      priceInUsd: 67.89,
      priceChangeInPercent: 2.93,
      country: Country(
        id: 'CA',
        name: 'Canada',
        imagePath: 'assets/images/countries/CA.png',
      ),
    ),
    Stock(
      id: '9',
      stockName: 'TCEHY',
      companyName: 'Tencent Holdings',
      logo: 'https://logo.clearbit.com/tencent.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 20)),
      isCompliant: false,
      priceInUsd: 42.15,
      priceChangeInPercent: -1.67,
      country: Country(
        id: 'CN',
        name: 'China',
        imagePath: 'assets/images/countries/CN.png',
      ),
    ),
    Stock(
      id: '10',
      stockName: 'AIR',
      companyName: 'Airbus SE',
      logo: 'https://logo.clearbit.com/airbus.com',
      updatedAt: DateTime.now().subtract(const Duration(minutes: 6)),
      isCompliant: true,
      priceInUsd: 145.67,
      priceChangeInPercent: 0.45,
      country: Country(
        id: 'NL',
        name: 'Netherlands',
        imagePath: 'assets/images/countries/NL.png',
      ),
    ),
  ];

  @override
  Future<Result<List<Stock>>> getStocks({
    required String? query,
    required bool? isCompliant,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      var filteredStocks = List<Stock>.from(_mockStocks);

      // Filter by compliance if specified
      if (isCompliant != null) {
        filteredStocks = filteredStocks
            .where((stock) => stock.isCompliant == isCompliant)
            .toList();
      }

      // Filter by search query if specified
      if (query != null && query.isNotEmpty) {
        final lowerQuery = query.toLowerCase();
        filteredStocks = filteredStocks.where((stock) {
          return stock.stockName.toLowerCase().contains(lowerQuery) ||
              stock.companyName.toLowerCase().contains(lowerQuery);
        }).toList();
      }

      return Ok(filteredStocks);
    } catch (e) {
      return Err(UnexpectedFailure(e.toString()));
    }
  }
}

