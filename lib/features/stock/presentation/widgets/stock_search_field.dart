import 'package:flutter/material.dart';
import 'package:stock_investment_app/core/presentation/theme/colors.dart';
import 'package:stock_investment_app/core/presentation/widgets/buttons/my_button.dart';

class StockSearchField extends StatelessWidget {
  const StockSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.search, size: 20),
            const SizedBox(width: 8),
            Text(
              'Search',
              style: TextTheme.of(context)
                  .bodyMedium!
                  .copyWith(color: MyColors.textSecondary),
            )
          ],
        ),
      ),
    );
  }
}
