class Offer {
  int? productId;
  int? offerId;
  String? imgUrl;
  int? typeId;
  String? type;
  String? offerName;
  String? disc;
  String? longDisc;
  int? price;
  int? quantity;
  String? code;
  int? visible;
  int? offerQuantity;
  int? percentage;
  int? newPrice;
  int? favouriteCount;

  Offer({
    this.productId,
    this.offerId,
    this.imgUrl,
    this.typeId,
    this.type,
    this.offerName,
    this.disc,
    this.longDisc,
    this.price,
    this.quantity,
    this.code,
    this.visible,
    this.offerQuantity,
    this.percentage,
    this.newPrice,
    this.favouriteCount,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      productId: json['product_id'],
      offerId: json['offer_id'],
      imgUrl: json['img_url'],
      typeId: json['type_id'],
      type: json['type'],
      offerName: json['product_name'],
      disc: json['disc'],
      longDisc: json['long_disc'],
      price: json['price'],
      quantity: json['quantity'],
      code: json['code'],
      visible: json['visible'],
      offerQuantity: json['offer_quantity'],
      percentage: json['percentage'],
      newPrice: json['new_price'],
      favouriteCount: json['favourite_count'],
    );
  }
  Offer.zero() {
    Offer(offerId: 0, price: 0, productId: 0);
  }
}