import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_detail_application/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Products> _products = [];
  List<Products> _filteredProducts = [];
  bool _isLoading = false;

  List<Products> get products => _filteredProducts;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final productModel = ProductModel.fromJson(data);
        _products = productModel.products ?? [];
        _filteredProducts = _products;
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Failed to load products');
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.title?.toLowerCase().contains(query.toLowerCase()) ??
              false)
          .toList();
    }
    notifyListeners();
  }

  Products getProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
