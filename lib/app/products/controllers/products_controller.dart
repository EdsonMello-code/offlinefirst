import 'package:flutter/material.dart';
import 'package:offlinefirst/app/products/models/product_model.dart';
import 'package:offlinefirst/app/products/repositories/product_repository.dart';

class ProductsController with ChangeNotifier {
  final ProductRepository repository;

  bool isLoading = false;
  List<ProductModel> products = [];

  ProductsController({
    required this.repository,
  });

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> addProduct(ProductModel product) async {
    setLoading(true);
    products = await repository.addProduct(product);
    setLoading(false);
  }

  Future<void> deleteProduct(ProductModel product) async {
    setLoading(true);
    products = await repository.deleteProduct(product);
    setLoading(false);
  }

  Future<void> getProducts() async {
    setLoading(true);
    products = await repository.getProducts();
    setLoading(false);
  }
}
