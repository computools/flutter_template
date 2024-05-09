import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String name;
  final String imageUrl;

  const Category({
    this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Category.empty() {
    return const Category(name: '', imageUrl: '');
  }

  @override
  List<Object?> get props => [id, name, imageUrl];
}
