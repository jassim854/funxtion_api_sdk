part of funxtion_sdk;

class ContentPackageItemsModel {
  int total;
  List<Data> data;

  ContentPackageItemsModel({
    required this.total,
    required this.data,
  });

  factory ContentPackageItemsModel.fromJson(Map<String, dynamic> json) =>
      ContentPackageItemsModel(
        total: json["total"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  String id;
  String type;
  DateTime createdAt;
  Datas data;

  Data({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        data: Datas.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class Datas {
  String id;
  String title;
  String slug;
  String image;
  String? gender;
  String level;
  List<int> goals;
  List<int>? types;
  List<String>? locations;
  List<int>? bodyParts;
  String duration;
  String? description;
  String? type;
  String? video;
  String? language;
  String? instructorId;
  int? externalId;
  List<int>? equipment;
  int? contentProvider;
  List<int>? contentTypes;
  List<String>? categories;

  Datas({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    this.gender,
    required this.level,
    required this.goals,
    this.types,
    this.locations,
    this.bodyParts,
    required this.duration,
    this.description,
    this.type,
    this.video,
    this.language,
    this.instructorId,
    this.externalId,
    this.equipment,
    this.contentProvider,
    this.contentTypes,
    this.categories,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        gender: json["gender"],
        level: json["level"],
        goals: List<int>.from(json["goals"].map((x) => x)),
        types: json["types"] == null
            ? []
            : List<int>.from(json["types"]!.map((x) => x)),
        locations: json["locations"] == null
            ? []
            : List<String>.from(json["locations"]!.map((x) => x)),
        bodyParts: json["body_parts"] == null
            ? []
            : List<int>.from(json["body_parts"]!.map((x) => x)),
        duration: json["duration"],
        description: json["description"],
        type: json["type"],
        video: json["video"],
        language: json["language"],
        instructorId: json["instructor_id"],
        externalId: json["external_id"],
        equipment: json["equipment"] == null
            ? []
            : List<int>.from(json["equipment"]!.map((x) => x)),
        contentProvider: json["content_provider"],
        contentTypes: json["content_types"] == null
            ? []
            : List<int>.from(json["content_types"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "gender": gender,
        "level": level,
        "goals": List<dynamic>.from(goals.map((x) => x)),
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
        "locations": locations == null
            ? []
            : List<dynamic>.from(locations!.map((x) => x)),
        "body_parts": bodyParts == null
            ? []
            : List<dynamic>.from(bodyParts!.map((x) => x)),
        "duration": duration,
        "description": description,
        "type": type,
        "video": video,
        "language": language,
        "instructor_id": instructorId,
        "external_id": externalId,
        "equipment": equipment == null
            ? []
            : List<dynamic>.from(equipment!.map((x) => x)),
        "content_provider": contentProvider,
        "content_types": contentTypes == null
            ? []
            : List<dynamic>.from(contentTypes!.map((x) => x)),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
      };
}
