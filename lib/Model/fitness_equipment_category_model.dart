part of funxtion_sdk;

class FitnessEquipmentCategoryModel {
  int id;
  String name;
  dynamic slug;
  String? description;
  Imag? image;

  FitnessEquipmentCategoryModel({
    required this.id,
    required this.name,
    this.slug,
    required this.description,
    required this.image,
  });

  factory FitnessEquipmentCategoryModel.fromJson(Map<String, dynamic> json) =>
      FitnessEquipmentCategoryModel(
          id: json["id"],
          name: json["name"],
          slug: json["slug"],
          description:
              json.containsKey('description') ? json["description"] : null,
          image:
              json.containsKey('image') ? Imag.fromJson(json["image"]) : null);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image?.toJson(),
      };
}
