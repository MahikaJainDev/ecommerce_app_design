import 'package:ecommerce_app_design/models/product_model.dart';
import 'package:flutter/material.dart';
import '../services/callbacks.dart';
import '../services/gateway.dart' as gateway;

class ProductProvider extends ChangeNotifier {
  String? _errorMessage;
  final List<ProductModel> _products = [];
  final List<String> _categories = [];
  final List<ProductModel> _filteredItems = [];
  String? selectedCategory;

  bool isLoading = false;

  String? get getErrorMessage => _errorMessage;
  List<ProductModel> get getProducts => _products;
  List<String> get getCategories => _categories;
  List<ProductModel> get getFilteredItems => _filteredItems;

  Future fetchProducts() async {
    isLoading = true;
    RequestStatus status = await gateway.getAllProducts();
    isLoading = false;

    if (status.isFailed) {
      _errorMessage = status.getMessage;
      return;
    }

    List<dynamic> productList = status.getBody;

    _products.clear();
    _categories.clear();

    for (Map<String, dynamic> element in productList) {
      ProductModel tempData = ProductModel.fromJson(element);
      _products.add(tempData);

      String category = tempData.category!.name!;
      if (!_categories.contains(category)) {
        _categories.add(category);
      }

      selectedCategory = _categories[0];
      _filteredItems.addAll(_products.where((eachProduct) => eachProduct.category!.name == selectedCategory));
    }

    notifyListeners();
  }

   filterItems() {
    _filteredItems.clear();
    _filteredItems.addAll(_products.where((eachProduct) => eachProduct.category!.name == selectedCategory));
    notifyListeners();
  }
}
