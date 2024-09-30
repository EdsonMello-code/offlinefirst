import 'package:drift/drift.dart';
import 'package:offlinefirst/app/core/services/app_database/drift_config.dart';
import 'package:offlinefirst/app/products/drivers/product_drivers_base.dart';
import 'package:offlinefirst/app/products/models/product_model.dart';

class ProductDatabaseImpl implements ProductDriversBase {
  final DriftConfig _driftConfig;

  const ProductDatabaseImpl(this._driftConfig);

  @override
  Future<void> addProduct(ProductModel product) async {
    await _driftConfig.into(_driftConfig.productTable).insert(
          product.toCampaignTableCompanion(),
        );
  }

  @override
  Future<void> deleteProduct(ProductModel product) async {
    await _driftConfig.executor.runDelete(
      'DELETE FROM ${_driftConfig.productTable.actualTableName} WHERE id = ?',
      [
        product.id,
      ],
    );
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final products = await _driftConfig.select(_driftConfig.productTable).get();
    return products.map((e) => ProductModel.fromData(e)).toList();
  }

  @override
  Future<void> saveAll(List<ProductModel> products) async {
    await _driftConfig.batch((batch) async {
      batch.insertAll(
        _driftConfig.productTable,
        products.map((e) => e.toCampaignTableCompanion()).toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}
