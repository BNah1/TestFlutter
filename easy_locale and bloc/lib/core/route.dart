import 'package:appscyclonebloc/presentation/screen/screenTest.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screen/homepage.dart';
import '../presentation/screen/streampage.dart';

final GoRouter route = GoRouter(
    initialLocation: "/",
    routes: [
        GoRoute(
        path: "/",
        name: "home",
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
      GoRoute(path: '/stream',
      builder: (BuildContext context, GoRouterState state){
        return const StreamPage();
      }
      ),
      GoRoute(path: '/screen',
          builder: (BuildContext context, GoRouterState state){
            return const Screentest();
          }
      )

]);
