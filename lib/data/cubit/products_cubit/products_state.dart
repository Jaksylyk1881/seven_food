part of 'products_cubit.dart';

abstract class ProductsState{}

class ProductsStateInitial extends ProductsState{}
class ProductsStateLoading extends ProductsState{}
class ProductsStateLoaded extends ProductsState{
  List<Product> products;
  ProductsStateLoaded(this.products);
}
class ProductsStateError extends ProductsState{
  String message;
  ProductsStateError(this.message);
}
