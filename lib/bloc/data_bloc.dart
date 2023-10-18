import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_test/models/category/category.dart';
import 'package:dio/dio.dart';
import 'package:food_app_test/repositories/products_repository.dart';
import 'package:food_app_test/utils/constants.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final ProductsRepository _productsRepository;

  DataBloc(this._productsRepository) : super(InitialDataState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingDataState());
      try {
        final data = await _productsRepository.fetchProductsCategories();
        emit(LoadedDataState(data: data));
      } catch (e) {
        emit(ErrorDataState(exeption: e.toString()));
      }
    });
  }
}
