import 'package:offlinefirst/app/products/models/product_model.dart';

abstract interface class ProductDriversBase {
  Future<List<ProductModel>> getProducts();

  Future<void> addProduct(ProductModel product);

  Future<void> deleteProduct(ProductModel product);

  Future<void> saveAll(List<ProductModel> products);
}
