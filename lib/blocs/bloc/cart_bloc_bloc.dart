import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_test/models/cart_model.dart';
import 'package:food_app_test/models/product/product.dart';
import 'package:food_app_test/repositories/itf_local_storage.dart';
import 'package:hive/hive.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ItfLocalStorage _hiveLocalStorage;
  CartBloc({required ItfLocalStorage hiveLocalStorage})
      : _hiveLocalStorage = hiveLocalStorage,
        super(CartIsLoading()) {
    on<CartInit>(_onCartStart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onCartStart(
    CartInit event,
    Emitter<CartState> emit,
  ) async {
    emit(CartIsLoading());
    try {
      Box box = await _hiveLocalStorage.initBox();
      List<Product> products =
          _hiveLocalStorage.loadProductsList(box).values.toList();

      emit(CartIsLoaded(cart: Cart(products: products)));
    } catch (_) {}
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartIsLoaded) {
      try {
        Box box = await _hiveLocalStorage.initBox();
        _hiveLocalStorage.addProductToBox(box, event.product);
        emit(
          CartIsLoaded(
            cart: state.cart.copyWith(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onRemoveProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartIsLoaded) {
      try {
        Box box = await _hiveLocalStorage.initBox();
        _hiveLocalStorage.removeProductFromBox(box, event.product);
        emit(
          CartIsLoaded(
            cart: state.cart.copyWith(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
