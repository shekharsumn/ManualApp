import 'package:auto_route/auto_route.dart';
import 'package:manual_app/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: IntroRoute.page, initial: true),
        AutoRoute(page: DynamicQuizRoute.page),
        AutoRoute(page: ChoiceTypeTextRoute.page),
        AutoRoute(page: ChoiceTypeImageRoute.page),
        AutoRoute(page: LearnMoreRoute.page),
        AutoRoute(page: ResultRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
