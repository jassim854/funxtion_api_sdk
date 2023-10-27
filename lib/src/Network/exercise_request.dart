import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class ExerciseRequest {
  static Future<List<ExerciseModel>?> listOfExercise(
      {bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7),
      String? whereOrderingAccordingToNameEqualTo,
      String? whereLimitContentPerPageIsEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereExerciseNameContains,
      String? whereLevelFieldEqualTo,
      String? whereEquipmentIdsInclude,
      String? whereEquipmentIdIsEqualTo,
      String? whereContentCategoryTypesIdsInclude,
      String? whereContentCategoryTypesIdsIsEqualTo,
      String? whereOrientationIsEqualTo,
      String? whereMuscleGroupIdsAnd,
      String? whereMuscleGroupIdIsEqualTo,
      String? whereContentCategoryTypesIdsAnd,
      String? whereContentCategoriesIdIsEqualTo,
      String? whereInstructorGenderIsEqualTo,
      String? whereInstructorGenderAnd,
      String? whereInstructorGenderInclude,
      String? whereOrientationAnd,
      String? whereOrientationInclude,
      String? whereLevelFieldAnd,
      String? whereLevelFieldInclude,
      String? whereEquipmentIdsAnd,
      String? whereMuscleGroupIdsInclude}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    Response<dynamic> response;
    bool? checkInternet;
    await Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        checkInternet = false;
      } else {
        checkInternet = true;
      }
    });
    try {
      if (kIsWeb) {
        _addDioCacheInterceptor(html.window.location.pathname ?? "",
            netwoerkHelper, maxStale, forceRefresh, checkInternet);
        response = await _apiCall(
          netwoerkHelper,
          whereContentCategoriesIdIsEqualTo: whereContentCategoriesIdIsEqualTo,
          whereContentCategoryTypesIdsAnd: whereContentCategoryTypesIdsAnd,
          whereContentCategoryTypesIdsInclude:
              whereContentCategoryTypesIdsInclude,
          whereContentCategoryTypesIdsIsEqualTo:
              whereContentCategoryTypesIdsIsEqualTo,
          whereEquipmentIdIsEqualTo: whereEquipmentIdIsEqualTo,
          whereEquipmentIdsInclude: whereEquipmentIdsInclude,
          whereExerciseNameContains: whereExerciseNameContains,
          whereInstructorGenderAnd: whereInstructorGenderAnd,
          whereInstructorGenderInclude: whereInstructorGenderInclude,
          whereInstructorGenderIsEqualTo: whereInstructorGenderIsEqualTo,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          whereMuscleGroupIdIsEqualTo: whereMuscleGroupIdIsEqualTo,
          whereMuscleGroupIdsAnd: whereMuscleGroupIdsAnd,
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          whereOrientationIsEqualTo: whereOrientationIsEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
          whereEquipmentIdsAnd: whereEquipmentIdsAnd,
          whereLevelFieldAnd: whereLevelFieldAnd,
          whereLevelFieldInclude: whereLevelFieldInclude,
          whereMuscleGroupIdsInclude: whereMuscleGroupIdsInclude,
          whereOrientationAnd: whereOrientationAnd,
          whereOrientationInclude: whereOrientationInclude,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(html.window.location.pathname ?? "",
              netwoerkHelper, maxStale, forceRefresh, checkInternet);
        });
        response = await _apiCall(
          netwoerkHelper,
          whereContentCategoriesIdIsEqualTo: whereContentCategoriesIdIsEqualTo,
          whereContentCategoryTypesIdsAnd: whereContentCategoryTypesIdsAnd,
          whereContentCategoryTypesIdsInclude:
              whereContentCategoryTypesIdsInclude,
          whereContentCategoryTypesIdsIsEqualTo:
              whereContentCategoryTypesIdsIsEqualTo,
          whereEquipmentIdIsEqualTo: whereEquipmentIdIsEqualTo,
          whereEquipmentIdsInclude: whereEquipmentIdsInclude,
          whereExerciseNameContains: whereExerciseNameContains,
          whereInstructorGenderAnd: whereInstructorGenderAnd,
          whereInstructorGenderInclude: whereInstructorGenderInclude,
          whereInstructorGenderIsEqualTo: whereInstructorGenderIsEqualTo,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          whereMuscleGroupIdIsEqualTo: whereMuscleGroupIdIsEqualTo,
          whereMuscleGroupIdsAnd: whereMuscleGroupIdsAnd,
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          whereOrientationIsEqualTo: whereOrientationIsEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
          whereEquipmentIdsAnd: whereEquipmentIdsAnd,
          whereLevelFieldAnd: whereLevelFieldAnd,
          whereLevelFieldInclude: whereLevelFieldInclude,
          whereMuscleGroupIdsInclude: whereMuscleGroupIdsInclude,
          whereOrientationAnd: whereOrientationAnd,
          whereOrientationInclude: whereOrientationInclude,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        List<ExerciseModel> data = List<ExerciseModel>.from(
            response.data["data"].map((x) => ExerciseModel.fromJson(x)));

        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
    return null;
  }

  static Future<Response<dynamic>> _apiCall(NetwoerkHelper netwoerkHelper,
      {String? whereOrderingAccordingToNameEqualTo,
      String? whereLimitContentPerPageIsEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereExerciseNameContains,
      String? whereLevelFieldEqualTo,
      String? whereEquipmentIdsInclude,
      String? whereEquipmentIdIsEqualTo,
      String? whereContentCategoryTypesIdsInclude,
      String? whereContentCategoryTypesIdsIsEqualTo,
      String? whereOrientationIsEqualTo,
      String? whereMuscleGroupIdsAnd,
      String? whereMuscleGroupIdIsEqualTo,
      String? whereContentCategoryTypesIdsAnd,
      String? whereContentCategoriesIdIsEqualTo,
      String? whereInstructorGenderIsEqualTo,
      String? whereInstructorGenderAnd,
      String? whereInstructorGenderInclude,
      String? whereOrientationAnd,
      String? whereOrientationInclude,
      String? whereLevelFieldAnd,
      String? whereLevelFieldInclude,
      String? whereEquipmentIdsAnd,
      String? whereMuscleGroupIdsInclude}) {
    return netwoerkHelper.getListOfExerciseRequest(
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereExerciseNameContains != null)
          "filter[where][q][contains]": whereExerciseNameContains,
        if (whereInstructorGenderIsEqualTo != null)
          "filter[where][gender][eq]": whereInstructorGenderIsEqualTo,
        if (whereInstructorGenderAnd != null)
          "filter[where][gender][and]": whereInstructorGenderAnd,
        if (whereInstructorGenderInclude != null)
          "filter[where][gender][in]": whereInstructorGenderInclude,
        if (whereOrientationIsEqualTo != null)
          "filter[where][orientation][eq]": whereOrientationIsEqualTo,
        if (whereOrientationAnd != null)
          "filter[where][orientation][and]": whereOrientationAnd,
        if (whereOrientationInclude != null)
          "filter[where][orientation][in]": whereOrientationInclude,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereLevelFieldAnd != null)
          "filter[where][level][and]": whereLevelFieldAnd,
        if (whereLevelFieldInclude != null)
          "filter[where][level][in]": whereLevelFieldInclude,
        if (whereEquipmentIdsInclude != null)
          "filter[where][equipment][in]": whereEquipmentIdsInclude,
        if (whereEquipmentIdsAnd != null)
          "filter[where][equipment][and]": whereEquipmentIdsAnd,
        if (whereEquipmentIdIsEqualTo != null)
          "filter[where][equipment][eq]": whereEquipmentIdIsEqualTo,
        if (whereMuscleGroupIdsInclude != null)
          "filter[where][muscle_groups][in]": whereMuscleGroupIdsInclude,
        if (whereMuscleGroupIdsAnd != null)
          "filter[where][muscle_groups][and]": whereMuscleGroupIdsAnd,
        if (whereMuscleGroupIdIsEqualTo != null)
          "filter[where][muscle_groups][eq]": whereMuscleGroupIdIsEqualTo,
        if (whereContentCategoryTypesIdsInclude != null)
          "filter[where][types][in]": whereContentCategoryTypesIdsInclude,
        if (whereContentCategoryTypesIdsIsEqualTo != null)
          "filter[where][types][eq]": whereContentCategoryTypesIdsIsEqualTo,
        if (whereContentCategoryTypesIdsAnd != null)
          "filter[where][types][eq]": whereContentCategoryTypesIdsAnd,
      },
    );
  }

  static Future<ExerciseModel?> exerciseById(
      {required String id,
      bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7)}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    Response<dynamic> response;
    bool? checkInternet;
    await Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        checkInternet = false;
      } else {
        checkInternet = true;
      }
    });
    try {
      if (kIsWeb) {
        _addDioCacheInterceptor(html.window.location.pathname ?? "",
            netwoerkHelper, maxStale, forceRefresh, checkInternet);
        response = await netwoerkHelper.getExerciseByIdRequest(
          id: id,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(html.window.location.pathname ?? "",
              netwoerkHelper, maxStale, forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getExerciseByIdRequest(
          id: id,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        ExerciseModel data = ExerciseModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
    return null;
  }

  static void _addDioCacheInterceptor(
    String path,
    NetwoerkHelper netwoerkHelper,
    Duration maxStale,
    bool forceRefresh,
    bool? checkInternet,
  ) {
    netwoerkHelper.dio.interceptors.add(DioCacheInterceptor(
        options: CacheOptions(
            store: HiveCacheStore(path),
            allowPostMethod: true,
            maxStale: maxStale,
            priority: CachePriority.high,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
