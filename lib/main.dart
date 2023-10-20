import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc_bloc.dart';
import 'package:food_app_test/blocs/data_bloc.dart';
import 'package:food_app_test/models/product/product.dart';

import 'package:food_app_test/repositories/hive_storage_repository.dart';
import 'package:food_app_test/repositories/products_repository.dart';
import 'package:food_app_test/router/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Hive.initFlutter();
  Hive.registerAdapter(ProductsAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductsRepository>(
            create: (context) => ProductsRepository()),
        RepositoryProvider<HiveStorageRepository>(
            create: (context) => HiveStorageRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DataBloc(
              RepositoryProvider.of<ProductsRepository>(context),
            )..add(
                LoadDataEvent(),
              ),
          ),
          BlocProvider(
              create: (context) => CartBloc(
                  hiveLocalStorage:
                      RepositoryProvider.of<HiveStorageRepository>(context))
                ..add(CartInit()))
        ],
        child: MaterialApp.router(
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
