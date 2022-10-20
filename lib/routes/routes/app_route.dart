import 'package:auto_route/auto_route.dart';
import 'package:barbero_dormilon/presentation/pages/home/home_page.dart';

@CustomAutoRouter(
  routes: <CustomRoute>[
    CustomRoute(
      page: HomePage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      path: "/",
    ),
  ],
  replaceInRouteName: "Page,Route",
)
class $AppRouter {}
