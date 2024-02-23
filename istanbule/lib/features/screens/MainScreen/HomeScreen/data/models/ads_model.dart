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
