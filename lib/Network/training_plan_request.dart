part of funxtion_sdk;

class TrainingPlanRequest {
  static Future<List<TrainingPlanModel>?> listOfTrainingPlan({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereDaysPerWeekIsEqualTo,
    String? whereGoalIdIsEqualTo,
    String? whereGoalIdsAre,
    String? whereLevelFieldEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereLocationIsEqualTo,
    String? whereNameIsEqualTo,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfTrainingPlanRequest(
        maxAge: maxAge ?? const Duration(days: 7),
        forceRefresh: forceRefresh ?? true,
        maxStale: maxStale,
        whereDaysPerWeekIsEqualTo: whereDaysPerWeekIsEqualTo,
        whereGoalIdIsEqualTo: whereGoalIdIsEqualTo,
        whereGoalIdsAre: whereGoalIdsAre,
        whereLevelFieldEqualTo: whereLevelFieldEqualTo,
        whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
        whereLocationIsEqualTo: whereLocationIsEqualTo,
        whereNameIsEqualTo: whereNameIsEqualTo,
        whereOrderingAccordingToNameEqualTo:
            whereOrderingAccordingToNameEqualTo,
        wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
      );
      if (response.statusCode == 200) {
        List<TrainingPlanModel> data = List.from(
            response.data['data'].map((e) => TrainingPlanModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

  static Future<TrainingPlanModel?> trainingPlanById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getTrainingPlanByIdRequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        TrainingPlanModel data = TrainingPlanModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }
}
