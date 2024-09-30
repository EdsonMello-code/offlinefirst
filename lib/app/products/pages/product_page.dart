import 'package:flutter/material.dart';
import 'package:offlinefirst/app/products/controllers/products_controller.dart';
import 'package:offlinefirst/app/products/models/product_model.dart';

class ProductsPage extends StatefulWidget {
  final ProductsController controller;

  const ProductsPage({
    super.key,
    required this.controller,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.controller.addProduct(
              ProductModel(
                title: 'Product ${widget.controller.products.length + 1}',
                price: 10.0,
                buyDate: DateTime.now(),
                image:
                    'https://media.istockphoto.com/id/1184633031/vector/cartoon-burger-vector-isolated-illustration.jpg?s=612x612&w=0&k=20&c=Z66WFszea0EkDxLe2179qxjBi4zvsOVvQsZ3AbQRjB8=',
              ),
            );
          },
        ),
        body: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            return Column(
              children: [
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    children: widget.controller.products
                        .map((product) => ListTile(
                              title:
                                  Text(product.title + product.id.toString()),
                              subtitle: Text(product.price.toString()),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.controller.deleteProduct(product);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
