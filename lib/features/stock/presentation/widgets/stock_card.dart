import 'package:flutter/material.dart';
import 'package:stock_investment_app/features/stock/domain/entities/stock.dart';

class StockCard extends StatelessWidget {
  const StockCard({super.key, required this.stock});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        spacing: 16,
        children: [
          // image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              stock.logo,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(stock.stockName),
                Text(stock.companyName),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${stock.priceInUsd} USD'),
              Text(
                '${stock.priceChangeInPercent.toString()}%',
                style: TextStyle(
                  color: stock.priceChangeInPercent > 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
