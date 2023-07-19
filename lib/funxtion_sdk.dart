library funxtion_sdk;

import 'dart:convert';
import 'dart:developer';

import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/services.dart';
import 'package:funxtion/Constant/constant_apis.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

part 'Network/list_workouts_request.dart';
part 'Model/workout_model.dart';

part 'Model/Helper/helper_model.dart';

part 'Network/get_a_workout.request.dart';


part 'Network/list_exercise_request.dart';
part 'Model/exercise_model.dart';

part 'Network/get_a_exercise_request.dart';


part 'Network/list_training_plans_request.dart';
part 'Model/training_plans_model.dart';

part 'Network/get_training_plan_request.dart';


part 'Network/list_equipment_request.dart';
part 'Model/equipment_model.dart';

part 'Network/get_equipment_request.dart';
// part 'Model/get_equipment_model.dart';

part 'Network/list_fitness_equipment_request.dart';
// part 'Model/list_fitness_equipment_model.dart';

part 'Network/get_fitness_equipment_request.dart';
part 'Model/fitness_equipment_category_model.dart';

part 'Network/list_fitness_goal_request.dart';
// part 'Model/list_fitness_goal_model.dart';

part 'Network/get_fitness_goal_request.dart';
part 'Model/fitness_goal_model.dart';

part 'Network/list_instructors_request.dart';


part 'Network/get_instructor_request.dart';
part 'Model/instructors_model.dart';

part 'Network/list_on_demand_request.dart';


part 'Network/get_on_demand_request.dart';
part 'Model/on_demand_model.dart';

part 'Network/list_content_provider_request.dart';


part 'Network/list_content_category_view.dart';
part 'Model/content_provider_category_ondemand_modell.dart';

part 'Network/list_on_demand_categories_request.dart';


part 'Network/list_muscle_group.request.dart';


part 'Network/get_muscle_group_request.dart';
part 'Model/muscle_group_model.dart';

part 'Network/get_body_parts_request.dart';


part 'Network/get_a_body_part_request.dart';
part 'Model/body_part_model.dart';

part 'Network/list_content_packages_request.dart';
part 'Model/content_package_model.dart';

part 'Network/get_content_package_request.dart';


part 'Network/list_content_packages_items_request.dart';
part 'Model/content_package_items_model.dart';

part 'Network/get_fitness_activities_type_request.dart';


part 'Network/get_fitness_activity_type_request.dart';
part 'Model/fitness_activity_type_model.dart';

part 'Network/auth_requests.dart';

Dio dio = Dio(BaseOptions(
  baseUrl: "https://api-staging.funxtion.com/v3/",
  headers: {
    "X-Scope": "platform",
    'Content-Type': 'application/json',
    "Authorization": token != null ? "Bearer $token" : ''
  },
));

DioCacheManager? _dioCacheManager;
String? token;
