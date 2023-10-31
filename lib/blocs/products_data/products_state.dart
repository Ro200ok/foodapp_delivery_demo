part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class InitialProductsState extends ProductsState {}

final class LoadingProductsState extends ProductsState {}

final class LoadedProductsState extends ProductsState {
  final List<ProductsCategory> productsCategories;

  const LoadedProductsState({required this.productsCategories});
}

final class ErrorProductsState extends ProductsState {
  final String exeption;

  const ErrorProductsState({required this.exeption});
}
