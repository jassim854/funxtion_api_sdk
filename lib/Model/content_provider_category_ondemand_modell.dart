part of funxtion_sdk;

class ContentProvidersCategoryOnDemandModel {
  int total;
  List<ContentCategoryData> data;

  ContentProvidersCategoryOnDemandModel({
    required this.total,
    required this.data,
  });

  factory ContentProvidersCategoryOnDemandModel.fromJson(
          Map<String, dynamic> json) =>
      ContentProvidersCategoryOnDemandModel(
        total: json["total"],
        data: List<ContentCategoryData>.from(
            json["data"].map((x) => ContentCategoryData.fromJson(x))),
      );
}

class ContentCategoryData {
  dynamic id;
  String name;
  dynamic slug;
  List<String>? entities;

  ContentCategoryData({
    required this.id,
    required this.name,
    required this.slug,
    required this.entities,
  });

  factory ContentCategoryData.fromJson(Map<String, dynamic> json) =>
      ContentCategoryData(
          id: json["id"],
          name: json["name"] is Map ? json['name']['en'] : json['name'],
          slug: json["slug"],
          entities: json.containsKey('entities')
              ? List<String>.from(json["entities"].map((x) => x))
              : null);
}
