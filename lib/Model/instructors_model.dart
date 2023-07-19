part of funxtion_sdk;

class InstructorModel {
  String id;
  String? userId;
  String name;
  String gender;
  Imag photo;

  InstructorModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.gender,
    required this.photo,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      InstructorModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        gender: json["gender"],
        photo: Imag.fromJson(json["photo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "gender": gender,
        "photo": photo.toJson(),
      };
}
