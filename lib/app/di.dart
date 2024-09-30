import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:offlinefirst/app/core/services/app_database/drift_config.dart';
import 'package:offlinefirst/app/core/services/connection_service/connection_service.dart';
import 'package:offlinefirst/app/core/services/connection_service/connection_service_impl.dart';
import 'package:offlinefirst/app/products/controllers/products_controller.dart';
import 'package:offlinefirst/app/products/drivers/api/product_api_impl.dart';
import 'package:offlinefirst/app/products/drivers/database/product_database_impl.dart';
import 'package:offlinefirst/app/products/repositories/product_repository.dart';
import 'package:offlinefirst/app/products/repositories/product_repository_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<ConnectionService>(() {
    return ConnectionServiceImpl();
  });
  getIt.registerFactory<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.127:3000',
      ),
    );
  });

  getIt.registerSingleton<DriftConfig>(DriftConfig());

  getIt.registerFactory<ProductApiImpl>(
    () => ProductApiImpl(
      dio: getIt.get<Dio>(),
    ),
  );
  getIt.registerFactory<ProductDatabaseImpl>(
    () => ProductDatabaseImpl(
      getIt.get<DriftConfig>(),
    ),
  );

  getIt.registerFactory<ProductRepository>(
    () => ProductRepositoryImpl(
      productDatabase: getIt.get<ProductDatabaseImpl>(),
      connectionService: getIt.get<ConnectionService>(),
      api: getIt.get<ProductApiImpl>(),
    ),
  );

  getIt.registerFactory<ProductsController>(() {
    return ProductsController(
      repository: getIt.get<ProductRepository>(),
    );
  });
}
