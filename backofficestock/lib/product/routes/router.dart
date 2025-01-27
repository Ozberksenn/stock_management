import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:backofficestock/view/home/home_view.dart';
import 'package:backofficestock/view/login/login_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    redirect: (context, state) {
      if (StorageService().token != "") {
        return "/home";
      } else {
        return "/";
      }
    },
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomeView(),
      )
    ]);
