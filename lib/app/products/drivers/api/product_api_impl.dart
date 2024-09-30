import 'package:dio/dio.dart';
import 'package:offlinefirst/app/products/drivers/product_drivers_base.dart';
import 'package:offlinefirst/app/products/models/product_model.dart';

class ProductApiImpl implements ProductDriversBase {
  final Dio dio;

  const ProductApiImpl({
    required this.dio,
  });

  @override
  Future<void> addProduct(ProductModel product) async {
    await dio.post(
      '/products',
      data: product.toMap(),
    );
  }

  @override
  Future<void> deleteProduct(ProductModel product) async {
    await dio.delete(
      '/products',
    );
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final productsMaps = await dio.get(
      '/products',
    );

    final products = productsMaps.data
        .map<ProductModel>(
          (map) => ProductModel.fromMap(map),
        )
        .toList();
    return products;
  }

  @override
  Future<void> saveAll(List<ProductModel> products) async {
    await dio.post(
      '/products',
      data: products.map((item) => item.toMap()).toList(),
    );
  }
}
