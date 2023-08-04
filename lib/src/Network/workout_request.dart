import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

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
      netwoerkHelper.dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors
          .add(netwoerkHelper.dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfWorkoutRequest(
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
          if (whereWorkoutNameContains != null)
            "filter[where][q][contains]": whereWorkoutNameContains,
          if (whereLevelFieldEqualTo != null)
            "filter[where][level][eq]": whereLevelFieldEqualTo,
          if (whereGoalIdsAre != null)
            "filter[where][goals][in]": whereGoalIdsAre,
          if (whereGoalIdIsEqualTo != null)
            "filter[where][goals][eq]": whereGoalIdIsEqualTo,
          if (whereBodyPartsIdsAre != null)
            "filter[where][body_parts][in]": whereBodyPartsIdsAre,
          if (whereBodyPartIdIsEqualTo != null)
            "filter[where][body_parts][eq]": whereBodyPartIdIsEqualTo,
          if (whereDurationIsEqualTo != null)
            "filter[where][duration][eq]": whereDurationIsEqualTo,
          if (whereTypeIdsAre != null)
            "filter[where][types][in]": whereTypeIdsAre,
          if (whereTypeIdIsEqualTo != null)
            "filter[where][types][eq]": whereTypeIdIsEqualTo,
          if (whereLocationIsEqualTo != null)
            "filter[where][location][eq]": whereLocationIsEqualTo,
        },
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
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
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

class _dioCacheManager {}
