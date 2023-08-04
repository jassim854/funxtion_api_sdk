import 'Model Helper/model_helper.dart';

class WorkoutModel {
  String id;
  String title;
  String slug;
  String? des;
  dynamic image;
  String gender;
  String level;
  String duration;

  List<int> types;
  List<int> goals;
  List<int> bodyParts;
  List<String> locations;
  List<Phase>? phases;

  List<String> contentPackages;

  WorkoutModel({
    this.des,
    this.phases,
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.gender,
    required this.level,
    required this.goals,
    required this.types,
    required this.locations,
    required this.bodyParts,
    required this.duration,
    required this.contentPackages,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
        id: json["id"],
        title: json["title"] is Map ? json['title']['en'] : json['title'],
        slug: json["slug"],
        des: json.containsKey('des') ? json['des']["en"] : '',
        image: json["image"],
        gender: json["gender"],
        level: json["level"],
        goals: List<int>.from(json["goals"].map((x) => x)),
        types: List<int>.from(json["types"].map((x) => x)),
        locations: List<String>.from(json["locations"].map((x) => x)),
        bodyParts: List<int>.from(json["body_parts"].map((x) => x)),
        duration: json["duration"],
        phases: json.containsKey('phases')
            ? List.from(json['phases'].map((x) => Phase.fromJson(x)))
            : null,
        contentPackages:
            List<String>.from(json["content_packages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "gender": gender,
        "level": level,
        "goals": List<dynamic>.from(goals.map((x) => x)),
        "types": List<dynamic>.from(types.map((x) => x)),
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "body_parts": List<dynamic>.from(bodyParts.map((x) => x)),
        "duration": duration,
        "content_packages": List<dynamic>.from(contentPackages.map((x) => x)),
      };
}
