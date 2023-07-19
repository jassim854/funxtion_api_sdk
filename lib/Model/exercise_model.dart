part of funxtion_sdk;

class ExerciseModel {
  String id;
  String name;
  String slug;
  String level;
  String gender;
  dynamic orientation;
  List<int> muscleGroups;
  List<int> equipment;
  List<int> types;
  var video;
  var gif;
  var image;
  List? steps;
  ExerciseModel(
      {required this.id,
      required this.name,
      required this.slug,
      required this.level,
      required this.gender,
      this.orientation,
      required this.muscleGroups,
      required this.equipment,
      required this.types,
      required this.video,
      required this.gif,
      required this.image,
      this.steps});

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        id: json.containsKey('id') ? json['id'] : '',
        name:
            json['name'] is Map ? json["name"]['en'].toString() : json['name'],
        slug: json["slug"],
        level: json["level"],
        gender: json["gender"],
        orientation: json["orientation"],
        muscleGroups: List<int>.from(json["muscle_groups"].map((x) => x)),
        equipment: List<int>.from(json["equipment"].map((x) => x)),
        types: List<int>.from(json["types"].map((x) => x)),
        video:
            json["video"] is Map ? Imag.fromJson(json['video']) : json['video'],
        gif: json["gif"] is Map ? Imag.fromJson(json['gif']) : json['gif'],
        image:
            json["image"] is Map ? Imag.fromJson(json['image']) : json['image'],
        steps:
            json.containsKey('steps') ? List.from(json["steps"]['en']) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "level": level,
        "gender": gender,
        "orientation": orientation,
        "muscle_groups": List<dynamic>.from(muscleGroups.map((x) => x)),
        "equipment": List<dynamic>.from(equipment.map((x) => x)),
        "types": List<dynamic>.from(types.map((x) => x)),
        "video": video,
        "gif": gif,
        "image": image,
        "steps": List<dynamic>.from(steps?.map((x) => x.toJson()) ?? []),
      };
}
