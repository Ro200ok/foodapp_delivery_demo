import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_test/bloc/data_bloc.dart';
import 'package:food_app_test/repositories/products_repository.dart';
import 'package:food_app_test/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(RepositoryProvider(
    create: (context) => ProductsRepository(),
    child: BlocProvider(
      create: (context) {
        return DataBloc(
          RepositoryProvider.of<ProductsRepository>(context),
        )..add(
            LoadDataEvent(),
          );
      },
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FoodApp Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
