import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_food/data/exeption_error.dart';
import 'package:seven_food/data/models/products/products.dart';
import 'package:seven_food/data/repository/showcases_services.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit() : super(ProductsStateInitial());
  List<Product> _list = [];

  Future<void> getProducts(int id) async{
    try{
      emit(ProductsStateLoading());
      _list = await ShowcasesService().getProducts(id);
      for(final Product p in _list){
        log('${p.name},  ${p.image}, \n');
      }
      emit(ProductsStateLoaded(_list));
    }on ErrorException catch(e){
      emit(ProductsStateError(e.message));
    }
  }

}
