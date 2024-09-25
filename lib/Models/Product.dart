
import 'Figure.dart';

class Product {
  Product(
      {required this.product_id,
      required this.name,
      required this.sub_title,
      required this.price,
      required this.quantity,
      required this.description,
      required this.category_id,
      required this.brand_id,
      required this.is_liked,
      required this.number_of_ratings,
      required this.ratings,
      this.discount_value,
      required this.images});

  final int product_id;
  final String name;
  final String sub_title;
  final double price;
  final int quantity;
  final String description;
  final int category_id;
  final int brand_id;
  final bool is_liked;
  final int number_of_ratings;
  final double ratings;
  final double? discount_value;
  final List<Figure> images;
}
