import 'package:backofficestock/view/home/home_view.dart';
import 'package:backofficestock/view/login/login_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: "/", builder: (context, state) => const LoginView(), routes: []),
  GoRoute(
    path: "/home",
    builder: (context, state) => const HomeView(),
  )
]);
