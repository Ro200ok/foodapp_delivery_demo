part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInit extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  const AddProduct(this.product);
  final Product product;

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  const RemoveProduct(this.product);
  final Product product;

  @override
  List<Object> get props => [product];
}
