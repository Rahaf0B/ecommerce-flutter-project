import 'package:ecommerce/Constants/Enums.dart';

class CategoryBrandScreenArguments {
  final int id;
  final PageType pageType;
  final String pageTitle;

  CategoryBrandScreenArguments(
      {required this.pageTitle, required this.id, required this.pageType});
}

class SubCategoryScreenArguments {
  final int? id;
  final PageType type;
  final SubPageType? subPageType;
  final String pageTitle;

  SubCategoryScreenArguments(
      {required this.pageTitle,
      this.id,
      required this.type,
      this.subPageType = SubPageType.None});
}

class ReviewsScreenArguments {
  final int product_id;

  ReviewsScreenArguments({
    required this.product_id,
  });
}

class AddReviewScreenArguments {
  final int product_id;

  AddReviewScreenArguments({
    required this.product_id,
  });
}

class CartScreenArguments {
  final PreviousNavigatorType previousNavigatorType;

  CartScreenArguments({
    required this.previousNavigatorType,
  });
}

class OrderSummaryScreenArguments {
  final int order_id;

  OrderSummaryScreenArguments({
    required this.order_id,
  });
}

class PaymentSummaryScreenArguments {
  final int order_id;
  final int address_id;

  PaymentSummaryScreenArguments({
    required this.address_id,
    required this.order_id,
  });
}

class ConfirmScreenArguments {
  final int order_id;

  ConfirmScreenArguments({
    required this.order_id,
  });
}

class ProductScreenArguments {
  final int product_id;

  ProductScreenArguments({
    required this.product_id,
  });
}

class ItemOrderedScreenArguments {
  final int order_id;

  ItemOrderedScreenArguments({
    required this.order_id,
  });
}
