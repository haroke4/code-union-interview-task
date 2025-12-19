import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_investment_app/core/presentation/widgets/buttons/my_button.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: () => context.pop(),
      padding: const EdgeInsets.all(8),
      child: Icon(
        Icons.arrow_back,
        size: 20,
      ),
    );
  }
}
