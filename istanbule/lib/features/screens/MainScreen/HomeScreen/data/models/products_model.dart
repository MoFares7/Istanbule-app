class Products {
  int? id;
  String? name;
  String? imgUrl;
  int? typeId;
  String? type;
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
    this.type,
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
      type: json['type'],
      disc: json['disc'],
      longDisc: json['long_disc'],
      price: json['price'],
      quantity: json['quantity'],
      code: json['code'],
      visible: json['visible'],
      favouriteCount: json['favourite_count'],
    );
  }
}
