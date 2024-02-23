class CityModel {
  int? id;
  String? name;

  CityModel({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<CityModel> fromJsonList(Map<String, dynamic> json) {
    List<CityModel> cities = [];
    json["data"].forEach((element) => cities.add(CityModel.fromJson(element)));
    return cities;
  }

  factory CityModel.zero() => CityModel(
        name: "",
      );
}
