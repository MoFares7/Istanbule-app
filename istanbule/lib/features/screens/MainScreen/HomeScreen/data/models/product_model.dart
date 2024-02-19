class ProductModel {
  bool status;
  List<Ad> ads;
  List<Products> topProducts;
  List<Offer> topOffers;

  ProductModel({
    required this.status,
    required this.ads,
    required this.topProducts,
    required this.topOffers,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'],
      ads: (json['ads'] as List).map((ad) => Ad.fromJson(ad)).toList(),
      topProducts: (json['top_products'] as List)
          .map((product) => Products.fromJson(product))
          .toList(),
      topOffers: (json['top_offers'] as List)
          .map((offer) => Offer.fromJson(offer))
          .toList(),
    );
  }

  factory ProductModel.zero() => ProductModel(
        status: false,
        ads: [],
        topProducts: [],
        topOffers: [],
      );
}

class Ad {
  int? id;
  String? imgUrl;

  Ad({
     this.id,
     this.imgUrl,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'],
      imgUrl: json['img_url'],
    );
  }
}

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

class Offer {
  int? productId;
  int? offerId;
  String? imgUrl;
  int? typeId;
  String? type;
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
}



// import 'package:istanbule/features/screens/MainScreen/HomeScreen/domain/entity/product.dart';

// class ProductModel {
//   ProductAds productAds;
//   ProductTop productTop;

//   ProductModel({required this.productAds, required this.productTop});

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         productAds: ProductAds.fromJson(json["ads"]),
//         productTop: ProductTop.fromJson(json["top_products"]),
//       );
// }

// class ProductAds extends Product {
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'img_url': image,
//     };
//   }

//   factory ProductAds.fromJson(Map<String, dynamic> json) => ProductAds(
//         id: json["id"],
//         image: json["img_url"],
//       );

//   static List<ProductAds> fromJsonList(Map<String, dynamic> json) {
//     List<ProductAds> productsAds = [];
//     json["ads"]
//         .forEach((element) => productsAds.add(ProductAds.fromJson(element)));
//     return productsAds;
//   }

//   ProductAds({
//     super.id,
//     super.image,
//   });
// }

// class ProductTop extends Product {
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'img_url': image,
//       'type_id': typeId,
//       'type': type,
//       'disc': discribtion,
//       'price': price,
//       'quantity': quantity,
//       'code': code,
//     };
//   }

//   factory ProductTop.fromJson(Map<String, dynamic> json) => ProductTop(
//         id: json["id"],
//         name: json["name"],
//         image: json["img_url"],
//         typeId: json["type_id"],
//         type: json["type"],
//         discribtion: json["disc"],
//         price: json["price"],
//         quantity: json["quantity"],
//         code: json["code"],
//       );

//   static List<ProductTop> fromJsonList(Map<String, dynamic> json) {
//     List<ProductTop> productsTop = [];
//     json["top_products"]
//         .forEach((element) => productsTop.add(ProductTop.fromJson(element)));
//     return productsTop;
//   }

//   factory ProductTop.zero() => ProductTop(
//         name: "",
//         image: "",
//       );

//   ProductTop({
//     super.id,
//     super.name,
//     super.image,
//     super.typeId,
//     super.type,
//     super.discribtion,
//     super.price,
//     super.quantity,
//     super.code,
//     super.offer_quantity,
//     super.percentage,
//     super.newPrice,
//   });
// }
