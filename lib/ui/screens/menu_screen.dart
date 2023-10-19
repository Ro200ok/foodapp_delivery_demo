import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/bloc/data_bloc.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/router/app_paths.dart';
import 'package:food_app_test/ui/components/category_item.dart';
import 'package:food_app_test/ui/components/custom_app_bar.dart';
import 'package:food_app_test/ui/components/promo_timer.dart';
import 'package:food_app_test/utils/constants.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Категории'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is InitialDataState || state is LoadingDataState) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: .5,
                ),
              );
            } else if (state is LoadedDataState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Image.asset(
                          AppConstants.promoPizzaPath,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: screenHeight / 40,
                          right: screenWidth / 39.2,
                          child: const PromoTimer(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight / 1.60,
                    child: GridView.builder(
                        itemCount: state.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.95,
                                crossAxisCount: 2),
                        itemBuilder: (contex, index) {
                          final category = state.data[index];
                          return InkWell(
                            onTap: () {
                              context.goNamed(AppPaths.menuCategory,
                                  extra: category.products as List<Product>);
                              log('tap tap');
                            },
                            child: CategoryItem(
                              category: category,
                              key: UniqueKey(),
                            ),
                          );
                        }),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('Ошибка инициализации'),
              );
            }
          },
        ),
      ),
    );
  }
}
