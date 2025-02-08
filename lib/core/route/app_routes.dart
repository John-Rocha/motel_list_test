import 'package:go_router/go_router.dart';
import 'package:motel_list_test/domain/entities/suite_entity.dart';

import 'package:motel_list_test/presenter/pages/motels_home_page.dart';
import 'package:motel_list_test/presenter/pages/suite_details.dart';

sealed class AppRoutes {
  static const String home = '/';
  static const String suiteDetails = 'suite-details';

  static final router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'home',
        path: home,
        builder: (context, state) => MotelsHomePage(),
      ),
      GoRoute(
        name: suiteDetails,
        path: '/suite-details',
        builder: (context, state) {
          final suite = state.extra as SuiteEntity;
          return SuiteDetails(
            suite: suite,
          );
        },
      ),
    ],
  );
}
