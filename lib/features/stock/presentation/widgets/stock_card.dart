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
        children: [
          // image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(stock.logo, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
