import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc.dart';
import 'package:food_app_test/blocs/products_bloc.dart';
import 'package:food_app_test/generated/codegen_loader.g.dart';
import 'package:food_app_test/models/product/product.dart';

import 'package:food_app_test/repositories/hive_cart_repository.dart';
import 'package:food_app_test/repositories/products_repository.dart';
import 'package:food_app_test/router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Hive.initFlutter();
  Hive.registerAdapter(CartStorage());

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductsRepository>(
            create: (context) => ProductsRepository()),
        RepositoryProvider<HiveCartRepository>(
            create: (context) => HiveCartRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(
              RepositoryProvider.of<ProductsRepository>(context),
            )..add(
                LoadDataEvent(),
              ),
          ),
          BlocProvider(
              create: (context) => CartBloc(
                  hiveLocalStorage:
                      RepositoryProvider.of<HiveCartRepository>(context))
                ..add(CartInit()))
        ],
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'FoodApp Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: goRouter,
        ),
      ),
    );
  }
}
