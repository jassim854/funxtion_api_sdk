class Imag {
  String id;
  String name;
  String mime;
  String url;
  DateTime createdAt;

  Imag({
    required this.id,
    required this.name,
    required this.mime,
    required this.url,
    required this.createdAt,
  });

  factory Imag.fromJson(Map<String, dynamic> json) => Imag(
        id: json["id"],
        name: json["name"],
        mime: json["mime"],
        url: json["url"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mime": mime,
        "url": url,
        "created_at": createdAt.toIso8601String(),
      };
}

class Phase {
  String title;
  int time;
  List<Item> items;

  Phase({
    required this.title,
    required this.time,
    required this.items,
  });

  factory Phase.fromJson(Map<String, dynamic> json) => Phase(
        title: json["title"]["en"],
        time: json["time"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "time": time,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String type;
  String notes;
  List<SeExercise>? seExercises;
  List<CtRound>? ctRounds;

  Item({
    required this.type,
    required this.notes,
    this.seExercises,
    this.ctRounds,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        type: json["type"],
        notes: json["notes"]["en"],
        seExercises: json["se_exercises"] == null
            ? []
            : List<SeExercise>.from(
                json["se_exercises"]!.map((x) => SeExercise.fromJson(x))),
        ctRounds: json["ct_rounds"] == null
            ? []
            : List<CtRound>.from(
                json["ct_rounds"]!.map((x) => CtRound.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "notes": notes,
        "se_exercises": seExercises == null
            ? []
            : List<dynamic>.from(seExercises!.map((x) => x.toJson())),
        "ct_rounds": ctRounds == null
            ? []
            : List<dynamic>.from(ctRounds!.map((x) => x.toJson())),
      };
}

class CtRound {
  int restRound;
  int work;
  int rest;
  List<Exercise> exercises;

  CtRound({
    required this.restRound,
    required this.work,
    required this.rest,
    required this.exercises,
  });

  factory CtRound.fromJson(Map<String, dynamic> json) => CtRound(
        restRound: json["rest_round"],
        work: json["work"],
        rest: json["rest"],
        exercises: List<Exercise>.from(
            json["exercises"].map((x) => Exercise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rest_round": restRound,
        "work": work,
        "rest": rest,
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
      };
}

class Exercise {
  String notes;
  List<dynamic> resistanceTargets;
  String exerciseId;

  Exercise({
    required this.notes,
    required this.resistanceTargets,
    required this.exerciseId,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        notes: json["notes"]['en'],
        resistanceTargets:
            List<dynamic>.from(json["resistance_targets"].map((x) => x)),
        exerciseId: json["exercise_id"],
      );

  Map<String, dynamic> toJson() => {
        "notes": notes,
        "resistance_targets":
            List<dynamic>.from(resistanceTargets.map((x) => x)),
        "exercise_id": exerciseId,
      };
}

class SeExercise {
  String exerciseId;
  String notes;
  List<Set> sets;

  SeExercise({
    required this.exerciseId,
    required this.notes,
    required this.sets,
  });

  factory SeExercise.fromJson(Map<String, dynamic> json) => SeExercise(
        exerciseId: json["exercise_id"],
        notes: json["notes"]['en'],
        sets: List<Set>.from(json["sets"].map((x) => Set.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "notes": notes,
        "sets": List<dynamic>.from(sets.map((x) => x.toJson())),
      };
}

class Set {
  String notes;
  List<GoalTarget> goalTargets;
  List<dynamic> resistanceTargets;
  int rest;

  Set({
    required this.notes,
    required this.goalTargets,
    required this.resistanceTargets,
    required this.rest,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        notes: json["notes"]['en'],
        goalTargets: List<GoalTarget>.from(
            json["goal_targets"].map((x) => GoalTarget.fromJson(x))),
        resistanceTargets:
            List<dynamic>.from(json["resistance_targets"].map((x) => x)),
        rest: json["rest"],
      );

  Map<String, dynamic> toJson() => {
        "notes": notes,
        "goal_targets": List<dynamic>.from(goalTargets.map((x) => x.toJson())),
        "resistance_targets":
            List<dynamic>.from(resistanceTargets.map((x) => x)),
        "rest": rest,
      };
}

class GoalTarget {
  String type;
  String metric;
  dynamic value;

  GoalTarget({
    required this.type,
    required this.metric,
    required this.value,
  });

  factory GoalTarget.fromJson(Map<String, dynamic> json) => GoalTarget(
        type: json["type"],
        metric: json["metric"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "metric": metric,
        "value": value,
      };
}

class Week {
  List<Day> days;

  Week({
    required this.days,
  });

  factory Week.fromJson(Map<String, dynamic> json) => Week(
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class Day {
  List<Activity> activities;

  Day({
    required this.activities,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        activities: List<Activity>.from(
            json["activities"].map((x) => Activity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
      };
}

class Activity {
  String type;
  String id;

  Activity({
    required this.type,
    required this.id,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
      };
}

class Field {
  String key;
  String type;

  Field({
    required this.key,
    required this.type,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        key: json["key"],
        type: json["type"],
      );
}
