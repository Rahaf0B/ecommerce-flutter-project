import 'package:ecommerce/Models/Figure.dart';

class Category {
  Category(
      {required this.category_id, required this.name, required this.image});
  final int category_id;
  final String name;
  final Figure image;
}
