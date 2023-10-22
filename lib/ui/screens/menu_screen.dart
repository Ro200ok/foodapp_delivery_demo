import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_test/blocs/products_bloc.dart';
import 'package:food_app_test/generated/locale_keys.g.dart';
import 'package:food_app_test/ui/components/category_item.dart';
import 'package:food_app_test/ui/components/promo_timer.dart';
import 'package:food_app_test/ui/components/set_locale_button.dart';
import 'package:food_app_test/utils/constants.dart';
import 'package:food_app_test/utils/helper.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                HelperLocale.setLocale(context);
              },
              icon: const Icon(Icons.language))
        ],
        title: Text(
          LocaleKeys.categories.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is InitialProductsState ||
                state is LoadingProductsState) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: .5,
                ),
              );
            } else if (state is LoadedProductsState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 120,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            AppConstants.promoPizzaPath,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            top: 20,
                            right: 10,
                            child: PromoTimer(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    flex: 2,
                    child: GridView.builder(
                        itemCount: state.productsCategories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.95,
                                crossAxisCount: 2),
                        itemBuilder: (contex, index) {
                          final category = state.productsCategories[index];

                          return CategoryItem(
                              category: category,
                              categoryName:
                                  AppConstants.categoriesNames[index].tr());
                        }),
                  )
                ],
              );
            } else if (state is ErrorProductsState) {
              return Center(
                child: Text(state.exeption.toString()),
              );
            } else {
              return const Center(
                child: Text('Что-то пошло не так'),
              );
            }
          },
        ),
      ),
    );
  }
}
