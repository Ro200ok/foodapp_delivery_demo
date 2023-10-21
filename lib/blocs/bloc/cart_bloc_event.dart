part of 'cart_bloc_bloc.dart';

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

  // Product copyWith({Product? product}) {
  //   return Product(
  //       product?.id ?? this.product.id,
  //       product?.name ?? this.product.name,
  //       product?.image_url ?? this.product.image_url,
  //       product?.cost ?? this.product.cost,
  //       product?.sizes ?? this.product.sizes,
  //       product?.categoryId ?? this.product.categoryId,
  //       product?.description ?? this.product.description);
  // }

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  const RemoveProduct(this.product);
  final Product product;

  @override
  List<Object> get props => [product];
}
