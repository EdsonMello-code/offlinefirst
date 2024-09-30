import 'package:offlinefirst/app/products/models/product_model.dart';

abstract interface class ProductRepository {
  Future<List<ProductModel>> getProducts();

  Future<List<ProductModel>> addProduct(ProductModel product);

  Future<List<ProductModel>> deleteProduct(ProductModel product);
}
