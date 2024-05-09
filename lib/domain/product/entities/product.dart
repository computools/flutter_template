import 'package:equatable/equatable.dart';
import 'package:flutter_template/domain/product/entities/category.dart';

class Product extends Equatable {
  final int? id;
  final String title;
  final double price;
  final Category category;
  final String description;
  final List<String> imagesUrls;

  const Product({
    this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imagesUrls,
  });

  factory Product.empty() {
    return Product(
      title: '',
      price: 0.0,
      category: Category.empty(),
      description: '',
      imagesUrls: const [],
    );
  }

  @override
  List<Object?> get props => [id, title, price, category, description, imagesUrls];
}
