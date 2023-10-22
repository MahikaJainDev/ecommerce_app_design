import 'package:ecommerce_app_design/models/product_model.dart';
import 'package:flutter/material.dart';
import '../services/callbacks.dart';
import '../services/gateway.dart' as gateway;

class ProductProvider extends ChangeNotifier {
  String? _errorMessage;
  final List<ProductModel> _products = [];
  final List<String> _categories = [];

  bool isLoading = false;

  String? get getErrorMessage => _errorMessage;
  List<ProductModel> get getProducts => _products;
  List<String> get getCategories => _categories;

  Future fetchProducts() async {
    isLoading = true;
    RequestStatus status = await gateway.getAllProducts();
    isLoading = false;

    if (status.isFailed) {
      _errorMessage = status.getMessage;
      return;
    }

    List<dynamic> productList = status.getBody; // Change this line

    // Clear the existing products
    _products.clear();
    _categories.clear();

    for (Map<String, dynamic> element in productList) {
      ProductModel tempData = ProductModel.fromJson(element);
      _products.add(tempData);

      String category = tempData.category!.name!;
      if (!_categories.contains(category)) {
        _categories.add(category);
      }
    }

    notifyListeners();
  }
}

//
  // Future fetchProducts() async {
  //   isLoading = true;
  //   RequestStatus status = await gateway.getAllProducts();
  //   isLoading = false;
  //   if (status.isFailed) {
  //     _errorMessage = status.getMessage;
  //     return;
  //   }
  //
  //   Map<String, dynamic> map = status.getBody;
  //   print(map);
  //   for(Map<String, dynamic> element in map['data']) {
  //     ProductModel tempData = ProductModel.fromJson(element);
  //     _products.add(tempData);
  //   }
  //   notifyListeners();
  // }