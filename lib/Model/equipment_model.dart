part of funxtion_sdk;

class EquipmentModel {
  int id;
  String name;
  String slug;
  var brandId;
  List<dynamic> categories;
  var description;
  var image;

  EquipmentModel({
    required this.id,
    required this.name,
    required this.slug,
    this.brandId,
    required this.categories,
    this.description,
    this.image,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) => EquipmentModel(
        id: json["id"],
        description:
            json.containsKey("description") && json["description"] != null
                ? json["description"]['en']
                : null,
        name: json["name"],
        slug: json["slug"],
        brandId: json["brand_id"],
        categories: List<int>.from(json["categories"].map((x) => x)),
        image:
            json["image"] is Map ? Imag.fromJson(json["image"]) : json['image'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "brand_id": brandId,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "image": image,
      };
}
