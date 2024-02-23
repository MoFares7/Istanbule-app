import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/ads_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/offer_model.dart';
import 'package:istanbule/features/screens/MainScreen/HomeScreen/data/models/products_model.dart';

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

