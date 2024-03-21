import 'dart:async';

import 'package:flutter_application_1/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';


class ProductBloc extends Cubit<List<Product>> {
  ProductBloc() : super([]);

  void addProduct(Product product) {
    state.add(product);
    emit(List.from(state));
  }

   void fetchProducts() {
    final reference = FirebaseDatabase.instance.reference().child('products');
    // reference.once().then((DataSnapshot snapshot) {
    //   final productsMap = snapshot.value;
    //   final List<Product> products = [];
    //   productsMap.forEach((key, value) {
    //     products.add(Product(
    //       id: key,
    //       name: value['name'],
    //       price: value['price'].toDouble(),
    //     ));
    //   });
    //   emit(products);
    // });
  }
  
}