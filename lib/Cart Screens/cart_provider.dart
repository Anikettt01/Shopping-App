import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
    final List<Map<String,dynamic>>cart = [];

    void AddProduct(Map<String,dynamic>product){
      cart.add(product);
      notifyListeners();
    }


    void RemoveProduct(Map<String,dynamic>product){
      cart.remove(product);
      notifyListeners();
    }
}