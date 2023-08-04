import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

class ExerciseRequest {
  static Future<List<ExerciseModel>?> listOfExercise({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereExerciseNameContains,
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
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getListOfExerciseRequest(
          queryParameters: {
            if (whereOrderingAccordingToNameEqualTo != null)
              "filter[order][name]": whereOrderingAccordingToNameEqualTo,
            if (whereLimitContentPerPageIsEqualTo != null)
              "filter[limit]": whereLimitContentPerPageIsEqualTo,
            if (wherePageNumberIsEqualTo != null)
              "filter[offset]": wherePageNumberIsEqualTo,
            if (whereExerciseNameContains != null)
              "filter[where][q][contains]": whereExerciseNameContains,
            if (whereLevelFieldEqualTo != null)
              "filter[where][level][eq]": whereLevelFieldEqualTo,
            if (whereEquipmentIdsAre != null)
              "filter[where][equipment.ids][in]": whereEquipmentIdsAre,
            if (whereEquipmentIdIsEqualTo != null)
              "filter[where][equipment.ids][eq]": whereEquipmentIdIsEqualTo,
            if (whereEquipmentBrandsAre != null)
              "filter[where][equipment.brand][in]": whereEquipmentBrandsAre,
            if (whereEquipmentBrandsIsEqualTo != null)
              "filter[where][equipment.brand][eq]":
                  whereEquipmentBrandsIsEqualTo,
            if (whereOrientationIsEqualTo != null)
              "filter[where][orientation][contains]": whereOrientationIsEqualTo,
            if (whereMuscleGroupIdsAre != null)
              "filter[where][muscle_groups.ids][in]": whereMuscleGroupIdsAre,
            if (whereMuscleGroupIdIsEqualTo != null)
              "filter[where][muscle_groups.ids][eq]":
                  whereMuscleGroupIdIsEqualTo,
            if (whereContentCategoriesIdsAre != null)
              "filter[where][content_categories.ids][in]":
                  whereContentCategoriesIdsAre,
            if (whereContentCategoriesIdIsEqualTo != null)
              "filter[where][content_categories.ids][eq]":
                  whereContentCategoriesIdIsEqualTo,
            if (whereGoalMetricsIsEqualTo != null)
              "filter[where][goal metrics][contains]":
                  whereGoalMetricsIsEqualTo,
            if (whereInstructorGenderIsEqualTo != null)
              "filter[where][instructor_gender][contains]":
                  whereInstructorGenderIsEqualTo,
            if (whereResistanceMetricsIsEqualTo != null)
              "filter[where][resistance metrics][contains]":
                  whereResistanceMetricsIsEqualTo
          },
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
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
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
