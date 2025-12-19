import 'package:auto_route/auto_route.dart';
import 'package:stock_investment_app/router/app_router/app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|Sheet,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  // Use SheetAutoRoute for all sheets if u want to use sheet as route
  // Use AutoRoute for all other routes
  @override
  List<AutoRoute> get routes {
    return [

      AutoRoute(page: StockListRoute.page, initial: true),
      AutoRoute(page: StockSearchRoute.page),
    ];
  }
}
