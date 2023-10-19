import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_test/models/cart_model.dart';
import 'package:food_app_test/models/product/product.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartIsLoading()) {
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
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartIsLoaded(cart: Cart()));
    } catch (_) {}
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;
    if (state is CartIsLoaded) {
      try {
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
  ) {
    final state = this.state;
    if (state is CartIsLoaded) {
      try {
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
