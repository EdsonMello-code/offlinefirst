import 'package:flutter/material.dart';
import 'package:offlinefirst/app/di.dart';
import 'package:offlinefirst/app/products/controllers/products_controller.dart';

import 'products/pages/product_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.greenAccent,
      ),
      routes: {
        '/': (context) => ProductsPage(
              controller: getIt.get<ProductsController>(),
            ),
      },
      initialRoute: '/',
    );
  }
}
