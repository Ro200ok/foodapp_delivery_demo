part of 'data_bloc.dart';

sealed class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

final class InitialDataState extends DataState {}

final class LoadingDataState extends DataState {}

final class LoadedDataState extends DataState {
  final List<ProductsCategory> data;

  const LoadedDataState({required this.data});
}

final class ErrorDataState extends DataState {
  final String exeption;

  const ErrorDataState({required this.exeption});
}
