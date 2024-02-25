class CartItem {
  final String? name;
  final String? image;
  final int? price;
  final int? quantity;

  CartItem({
     this.name,
     this.image,
     this.price,
     this.quantity,
  });
}

class Product {
  final String name;
  final String image;
  final int price;
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
