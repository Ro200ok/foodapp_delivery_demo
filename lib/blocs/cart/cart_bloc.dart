import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_demo/models/cart_model.dart';
import 'package:food_delivery_demo/models/product/product.dart';
import 'package:food_delivery_demo/repositories/hive_cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final HiveCartRepository _hiveLocalStorage;
  CartBloc({required HiveCartRepository hiveLocalStorage})
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
      final box = await _hiveLocalStorage.init();
      final products = _hiveLocalStorage.loadCart(box);

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
        final products = List.of(state.cart.products)..add(event.product);
        final box = await _hiveLocalStorage.init();
        _hiveLocalStorage.updateCart(box, products);

        emit(
          CartIsLoaded(
            cart: state.cart.copyWith(
              products: products,
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
        final products = List.of(state.cart.products)..remove(event.product);
        final box = await _hiveLocalStorage.init();
        _hiveLocalStorage.updateCart(box, products);
        emit(
          CartIsLoaded(
            cart: state.cart.copyWith(
              products: products,
            ),
          ),
        );
      } catch (_) {}
    }
  }
}
