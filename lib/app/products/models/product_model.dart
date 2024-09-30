import 'package:drift/drift.dart';
import 'package:offlinefirst/app/core/services/app_database/drift_config.dart';

class ProductModel {
  final int? id;
  final String title;
  final double price;
  final DateTime buyDate;
  final String? image;

  const ProductModel({
    this.id,
    required this.title,
    required this.price,
    required this.buyDate,
    required this.image,
  });

  ProductTableCompanion toCampaignTableCompanion() {
    return ProductTableCompanion(
      id: Value.absentIfNull(id),
      title: Value(title),
      price: Value(price),
      buyDate: Value(buyDate),
      image: Value(image),
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'].toDouble(),
      buyDate: DateTime.parse(map['buyDate']),
      image: map['image'],
    );
  }

  factory ProductModel.fromData(ProductTableData data) {
    return ProductModel(
      id: data.id,
      title: data.title,
      price: data.price,
      buyDate: data.buyDate,
      image: data.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'buyDate': buyDate.toIso8601String(),
      'image': image,
    };
  }
}
