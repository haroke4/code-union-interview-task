// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:stock_investment_app/features/stock/presentation/screens/stock_list_screen.dart'
    as _i1;
import 'package:stock_investment_app/features/stock/presentation/screens/stock_search_screen.dart'
    as _i2;

/// generated route for
/// [_i1.StockListScreen]
class StockListRoute extends _i3.PageRouteInfo<void> {
  const StockListRoute({List<_i3.PageRouteInfo>? children})
      : super(StockListRoute.name, initialChildren: children);

  static const String name = 'StockListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i1.StockListScreen());
    },
  );
}

/// generated route for
/// [_i2.StockSearchScreen]
class StockSearchRoute extends _i3.PageRouteInfo<void> {
  const StockSearchRoute({List<_i3.PageRouteInfo>? children})
      : super(StockSearchRoute.name, initialChildren: children);

  static const String name = 'StockSearchRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.StockSearchScreen();
    },
  );
}
