class Products {
  int? id;
  String? name;
  String? imgUrl;
  int? typeId;
  String? disc;
  String? longDisc;
  int? price;
  int? quantity;
  String? code;
  int? visible;
  int? favouriteCount;

  Products({
    this.id,
    this.name,
    this.imgUrl,
    this.typeId,
    this.disc,
    this.longDisc,
    this.price,
    this.quantity,
    this.code,
    this.visible,
    this.favouriteCount,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      imgUrl: json['img_url'],
      typeId: json['type_id'],
      disc: json['disc'],
      longDisc: json['long_disc'],
      price: json['price'],
      quantity: json['quantity'],
      code: json['code'],
      visible: json['visible'],
      favouriteCount: json['favourite_count'],
    );
  }
  static List<Products> fromJsonList(Map<String, dynamic> json) {
    List<Products> products = [];
    json["products"]
        .forEach((element) => products.add(Products.fromJson(element)));
    return products;
  } 
   static List<Products> fromJsonListProduct(Map<String, dynamic> json) {
    List<Products> products = [];
    json["data"]
        .forEach((element) => products.add(Products.fromJson(element)));
    return products;
  }

  Products.zero() {
    Products(id: 0, price: 0, imgUrl: '', name: '', disc: '');
  }
}
