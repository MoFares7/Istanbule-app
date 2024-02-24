class FavouriteModel {
  int? id;
  int? userId;
  String? favouriteName;
  int? typeId;
  String? type;
  String? imgUrl;
  int? price;

  FavouriteModel(
      {this.id,
      this.userId,
      this.favouriteName,
      this.imgUrl,
      this.typeId,
      this.type,
      this.price});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
        id: json['product_id'],
        userId: json['user_id'],
        favouriteName: json['name'],
        imgUrl: json['img_url'],
        typeId: json['type_id'],
        type: json['type'],
        price: json['price']);
  }
  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      id: map['id'],
    );
  }

  static List<FavouriteModel> fromJsonList(Map<String, dynamic> json) {
    List<FavouriteModel> favourite = [];
    json["favourites"]
        .forEach((element) => favourite.add(FavouriteModel.fromJson(element)));
    return favourite;
  }

  factory FavouriteModel.zero() =>
      FavouriteModel(favouriteName: '', imgUrl: '', type: '');
}
