import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investment_app/core/presentation/widgets/buttons/my_back_button.dart';
import 'package:stock_investment_app/core/utils/service_locator.dart';
import 'package:stock_investment_app/features/stock/domain/repo/stock_repo.dart';
import 'package:stock_investment_app/features/stock/presentation/bloc/cubit/stock_list_cubit.dart';
import 'package:stock_investment_app/features/stock/presentation/widgets/stock_card.dart';
import 'package:stock_investment_app/features/stock/presentation/widgets/stock_search_field.dart';

@RoutePage()
class StockListScreen extends StatelessWidget implements AutoRouteWrapper {
  const StockListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => StockListCubit(getIt<StockRepo>())..getStocks(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const MyBackButton(),
                Expanded(
                  child: Text(
                    'Stock Investments',
                    style: TextTheme.of(context).headlineMedium,
                  ),
                ),
              ],
            ),
            StockSearchField(),
            Expanded(
              child: BlocBuilder<StockListCubit, StockListState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.failure != null) {
                    return Center(child: Text(state.failure.toString()));
                  }
                  if (state.stocks.isEmpty) {
                    return const Center(child: Text('No stocks found'));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.stocks.length,
                    itemBuilder: (context, index) {
                      return StockCard(stock: state.stocks[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
