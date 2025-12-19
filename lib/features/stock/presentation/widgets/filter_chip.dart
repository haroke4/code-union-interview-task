import 'package:flutter/material.dart';
import 'package:stock_investment_app/core/presentation/theme/colors.dart';
import 'package:stock_investment_app/core/presentation/widgets/buttons/my_button.dart';

class FilterChip extends StatelessWidget {
  const FilterChip({super.key, required this.onPressed, required this.child});
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          child,
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 14,
            color: MyColors.iconTertiary,
          ),
        ],
      ),
    );
  }
}
