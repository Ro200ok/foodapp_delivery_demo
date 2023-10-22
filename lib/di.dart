import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/bloc/cart_bloc.dart';
import 'package:food_app_test/blocs/products_bloc.dart';
import 'package:food_app_test/repositories/hive_cart_repository.dart';
import 'package:food_app_test/repositories/products_repository.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductsRepository>(
            create: (context) => ProductsRepository()),
        RepositoryProvider<HiveCartRepository>(
            create: (context) => HiveCartRepository()),
      ],
      child: MultiBlocProvider(providers: [
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
                RepositoryProvider.of<HiveCartRepository>(context),
          )..add(
              CartInit(),
            ),
        ),
      ], child: child),
    );
  }
}
