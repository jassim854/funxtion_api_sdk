
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';


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
    DioCacheManager  dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getListOfTrainingPlanRequest(
        maxAge: maxAge ?? const Duration(days: 7),
        forceRefresh: forceRefresh ?? true,
        maxStale: maxStale,
   queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereNameIsEqualTo != null)
          "filter[where][q][contains]": whereNameIsEqualTo,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereGoalIdsAre != null)
          "filter[where][goals][in]": whereGoalIdsAre,
        if (whereGoalIdIsEqualTo != null)
          "filter[where][goals][eq]": whereGoalIdIsEqualTo,
        if (whereDaysPerWeekIsEqualTo != null)
          "filter[where][days_per_week][eq]": whereDaysPerWeekIsEqualTo,
        if (whereLocationIsEqualTo != null)
          "filter[where][location][eq]": whereLocationIsEqualTo,
      },
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
    DioCacheManager  dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
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
