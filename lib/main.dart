import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_test/ui/conponents/category_item.dart';
import 'package:food_app_test/ui/conponents/promo_timer.dart';
import 'package:food_app_test/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodApp Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    log('$screenWidth  <<<< screenWidth');
    log('$screenHeight  <<<< screenHeight');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Категории',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppConstants.promoPizzaPath,
                    fit: BoxFit.contain,
                  ),
                  Positioned.fill(
                    top: screenHeight / 20.52,
                    right: screenWidth / 39.2,
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: PromoTimer(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[100],
              width: screenWidth,
              height: screenHeight / 1.46,
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.95,
                      crossAxisCount: 2),
                  itemBuilder: (contex, index) {
                    return CategoryItem(
                      key: UniqueKey(),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: screenWidth,
        height: 60,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: null, child: Text('Еда')),
            TextButton(onPressed: null, child: Text('Корзина'))
          ],
        ),
      ),
    );
  }
}
