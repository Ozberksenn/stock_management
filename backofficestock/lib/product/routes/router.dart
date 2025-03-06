import 'package:backofficestock/product/storage/app_storage.dart';
import 'package:backofficestock/view/home/home_view.dart';
import 'package:backofficestock/view/login/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final GoRouter router = GoRouter(
    redirect: (context, state) {
      bool expiredToken() {
        if (JwtDecoder.isExpired(StorageService().token)) {
          return true;
        } else {
          return false;
        }
      }

      if (StorageService().token != "" && expiredToken() == false) {
        return "/";
      } else {
        return "/login";
      }
    },
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeView(),
      )
    ]);
