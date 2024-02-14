class CartItem {
  final String name;
  final String image;
  final String price;
  final int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

class Product {
  final String name;
  final String image;
  final String price;
  final String oldPrice;
  final String total;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.total,
  });
}

class Order {
  final int id;
  final bool status;
  final String statusTitle;

  Order({
    required this.id,
    required this.status,
    required this.statusTitle,
  });
}
