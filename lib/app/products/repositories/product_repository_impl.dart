import 'package:offlinefirst/app/core/services/connection_service/connection_service.dart';
import 'package:offlinefirst/app/products/drivers/product_drivers_base.dart';
import 'package:offlinefirst/app/products/models/product_model.dart';

import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDriversBase productDatabase;
  final ProductDriversBase api;
  final ConnectionService connectionService;

  const ProductRepositoryImpl({
    required this.productDatabase,
    required this.connectionService,
    required this.api,
  });

  @override
  Future<List<ProductModel>> addProduct(ProductModel product) async {
    await productDatabase.addProduct(product);
    final isConnected = await connectionService.checkConnectionWithInternet();
    if (isConnected) {
      await _sync();
    }

    final products = await productDatabase.getProducts();

    return products;
  }

  @override
  Future<List<ProductModel>> deleteProduct(ProductModel product) async {
    await productDatabase.deleteProduct(product);

    final isConnected = await connectionService.checkConnectionWithInternet();

    if (isConnected) {
      await _sync();
    }

    final products = await productDatabase.getProducts();

    return products;
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final isConnected = await connectionService.checkConnectionWithInternet();

    if (isConnected) {
      final productsFromApi = await api.getProducts();
      await productDatabase.saveAll(productsFromApi);
    }

    return await productDatabase.getProducts();
  }

  Future<void> _sync() async {
    final isConnected = await connectionService.checkConnectionWithInternet();
    if (isConnected) {
      final products = await productDatabase.getProducts();
      await api.saveAll(products);
    }
  }
}
