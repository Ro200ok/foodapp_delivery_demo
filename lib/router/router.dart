import 'package:flutter/material.dart';
import 'package:food_delivery_demo/models/product/product.dart';
import 'package:food_delivery_demo/router/app_paths.dart';
import 'package:food_delivery_demo/ui/components/scaffold_nested_navigation.dart';
import 'package:food_delivery_demo/ui/screens/cart_screen.dart';
import 'package:food_delivery_demo/ui/screens/menu_category_screen.dart';
import 'package:food_delivery_demo/ui/screens/phone_auth_page.dart';
import 'package:food_delivery_demo/ui/screens/splash_screen.dart';
import 'package:food_delivery_demo/ui/screens/test_auth_success_screen.dart';
import 'package:go_router/go_router.dart';
import '../ui/screens/menu_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorFoodKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellFood');
final _shellNavigatorCartKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCart');
final _shellNavigatorUserProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellUserProfile');

final goRouter = GoRouter(
  initialLocation: AppPaths.menuScreen,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppPaths.splashScreen,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashScreen(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFoodKey,
          routes: [
            GoRoute(
              path: AppPaths.menuScreen,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MenuScreen(),
              ),
              routes: [
                GoRoute(
                    name: 'caterory',
                    path: AppPaths.menuCategory,
                    pageBuilder: (context, state) {
                      /// при использовании инспектора виджетов devtools возникает ошибка несоответствия типов,
                      /// проблема подробно изложена здесь https://github.com/flutter/flutter/issues/99099
                      final products = state.extra as List<Product>;

                      return NoTransitionPage(
                          child: MenuCategoryScreen(
                        products: products,
                      ));
                    }),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCartKey,
          routes: [
            GoRoute(
              path: AppPaths.cartScreen,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CartScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorUserProfileKey,
          routes: [
            GoRoute(
              path: AppPaths.phoneAuthPage,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PhoneAuthPage(),
              ),
            ),
            GoRoute(
              path: AppPaths.authSuccess,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TestAuthSuccessScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
