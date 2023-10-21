part of 'cart_bloc_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
}

class CartIsLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartIsLoaded extends CartState {
  final Cart cart;
  bool canAnimate;

  CartIsLoaded({required this.cart, this.canAnimate = true});

  @override
  List<Object> get props => [cart];
}
