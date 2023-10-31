import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_demo/blocs/cart/cart_bloc.dart';
import 'package:food_delivery_demo/blocs/phone_auth/phone_auth_bloc.dart';
import 'package:food_delivery_demo/repositories/hive_cart_repository.dart';
import 'package:food_delivery_demo/repositories/phone_auth_repository.dart';
import 'package:food_delivery_demo/repositories/products_repository.dart';

import 'blocs/products_data/products_bloc.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PhoneAuthRepository>(
          create: (context) => PhoneAuthRepository(),
        ),
        RepositoryProvider<ProductsRepository>(
          create: (context) => ProductsRepository(),
        ),
        RepositoryProvider<HiveCartRepository>(
          create: (context) => HiveCartRepository(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => PhoneAuthBloc(
            phoneAuthRepository:
                RepositoryProvider.of<PhoneAuthRepository>(context),
          ),
        ),
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
