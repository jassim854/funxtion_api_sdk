part of funxtion_sdk;

class ExerciseRequest {
  static Future<List<ExerciseModel>?> listOfExercise({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereExerciseNameIsEqualTo,

    String? whereLevelFieldEqualTo,
    String? whereEquipmentIdIsEqualTo,
    String? whereEquipmentBrandsIsEqualTo,
    String? whereOrientationIsEqualTo,
    String? whereMuscleGroupIdIsEqualTo,
    String? whereContentCategoriesIdIsEqualTo,
    String? whereGoalMetricsIsEqualTo,
    String? whereInstructorGenderIsEqualTo,
    String? whereResistanceMetricsIsEqualTo,
    String? whereContentCategoriesIdsAre,
    String? whereEquipmentBrandsAre,
    String? whereEquipmentIdsAre,
    String? whereMuscleGroupIdsAre,
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();

    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfExerciseRequest(
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
          whereEquipmentIdIsEqualTo: whereEquipmentIdIsEqualTo,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereOrientationIsEqualTo: whereOrientationIsEqualTo,
          whereContentCategoriesIdIsEqualTo: whereContentCategoriesIdIsEqualTo,
          whereEquipmentBrandsIsEqualTo: whereEquipmentBrandsIsEqualTo,
          whereExerciseNameContains: whereExerciseNameIsEqualTo,
          whereGoalMetricsIsEqualTo: whereGoalMetricsIsEqualTo,
          whereInstructorGenderIsEqualTo: whereInstructorGenderIsEqualTo,
          
          whereMuscleGroupIdIsEqualTo: whereMuscleGroupIdIsEqualTo,
          whereResistanceMetricsIsEqualTo: whereResistanceMetricsIsEqualTo,
          whereContentCategoriesIdsAre: whereContentCategoriesIdsAre,
          whereEquipmentBrandsAre: whereEquipmentBrandsAre,
          whereEquipmentIdsAre: whereEquipmentIdsAre,
          whereMuscleGroupIdsAre: whereMuscleGroupIdsAre,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh,
          maxStale: maxStale);

      if (response.statusCode == 200) {
        List<ExerciseModel> data = List<ExerciseModel>.from(
            response.data["data"].map((x) => ExerciseModel.fromJson(x)));

        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
    return null;
  }

  static Future<ExerciseModel?> exerciseById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getExerciseByIdRequest(
        id: id,
        maxAge: maxAge ?? const Duration(days: 7),
        forceRefresh: forceRefresh ?? true,
        maxStale: maxStale,
      );
      if (response.statusCode == 200) {
        ExerciseModel data = ExerciseModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
    return null;
  }
}
