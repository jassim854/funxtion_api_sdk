part of funxtion_sdk;

class WorkoutRequest {
  static Future<List<WorkoutModel>?> listOfWorkout({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereBodyPartIdIsEqualTo,
    String? whereBodyPartsIdsAre,
    String? whereDurationIsEqualTo,
    String? whereGoalIdIsEqualTo,
    String? whereGoalIdsAre,
    String? whereLevelFieldEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereLocationIsEqualTo,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereTypeIdIsEqualTo,
    String? whereTypeIdsAre,
    String? whereWorkoutNameContains,
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfWorkoutRequest(
        maxAge: maxAge ?? const Duration(days: 7),
        forceRefresh: forceRefresh ?? true,
        maxStale: maxStale,
        whereBodyPartIdIsEqualTo: whereBodyPartIdIsEqualTo,
        whereBodyPartsIdsAre: whereBodyPartsIdsAre,
        whereDurationIsEqualTo: whereDurationIsEqualTo,
        whereGoalIdIsEqualTo: whereGoalIdIsEqualTo,
        whereGoalIdsAre: whereGoalIdsAre,
        whereLevelFieldEqualTo: whereLevelFieldEqualTo,
        whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
        whereLocationIsEqualTo: whereLocationIsEqualTo,
        whereOrderingAccordingToNameEqualTo:
            whereOrderingAccordingToNameEqualTo,
        wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
        whereTypeIdIsEqualTo: whereTypeIdIsEqualTo,
        whereTypeIdsAre: whereTypeIdsAre,
        whereWorkoutNameContains: whereWorkoutNameContains,
      );
      if (response.statusCode == 200) {
        List<WorkoutModel> data = List.from(
            response.data['data'].map((e) => WorkoutModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

  static Future<WorkoutModel?> workoutById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getWorkoutByIdRequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        WorkoutModel data = WorkoutModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }
}
