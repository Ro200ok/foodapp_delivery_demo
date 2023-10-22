import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:dio/dio.dart';
import 'package:food_app_test/repositories/products_repository.dart';
import 'package:food_app_test/utils/constants.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsBloc(this._productsRepository)
      : super(
          InitialProductsState(),
        ) {
    on<LoadDataEvent>(_fetchProducts);
  }

  void _fetchProducts(LoadDataEvent event, Emitter<ProductsState> emit) async {
    emit(
      LoadingProductsState(),
    );
    try {
      final data = await _productsRepository.fetchProductsCategories();
      emit(
        LoadedProductsState(productsCategories: data),
      );
    } catch (e) {
      emit(
        ErrorProductsState(
          exeption: e.toString(),
        ),
      );
    }
  }
}
