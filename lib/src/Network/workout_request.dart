import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class WorkoutRequest {
  static Future<List<WorkoutModel>?> listOfWorkout(
      {bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7),
      String? whereOrderingAccordingToNameEqualTo,
      String? whereLimitContentPerPageIsEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereWorkoutNameContains,
      String? whereLevelFieldEqualTo,
      String? whereGoalIdsInclude,
      String? whereGoalIdIsEqualTo,
      String? whereBodyPartsIdsInclude,
      String? whereBodyPartIdIsEqualTo,
      String? whereDurationIsEqualTo,
      String? whereTypeIdsInclude,
      String? whereTypeIdIsEqualTo,
      String? whereLocationIsEqualTo,
      String? whereGoalIdsAnd,
      String? whereBodyPartsIdsAnd,
      String? whereLevelFieldInclude,
      String? whereLevelFieldAnd,
      String? whereDurationIncludes,
      String? whereDurationAnd,
      String? whereTypeIdsAnd,
      String? whereLocationInclude,
      String? whereLocationAnd}) async {
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
        response = await apiCall(
          netwoerkHelper,
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
          whereWorkoutNameContains: whereWorkoutNameContains,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereGoalIdsInclude: whereGoalIdsInclude,
          whereGoalIdIsEqualTo: whereGoalIdIsEqualTo,
          whereBodyPartsIdsInclude: whereBodyPartsIdsInclude,
          whereBodyPartIdIsEqualTo: whereBodyPartIdIsEqualTo,
          whereDurationIsEqualTo: whereDurationIsEqualTo,
          whereTypeIdsInclude: whereTypeIdsInclude,
          whereTypeIdIsEqualTo: whereTypeIdIsEqualTo,
          whereLocationIsEqualTo: whereLocationIsEqualTo,
          whereBodyPartsIdsAnd: whereBodyPartsIdsAnd,
          whereDurationAnd: whereDurationAnd,
          whereDurationIncludes: whereDurationIncludes,
          whereGoalIdsAnd: whereGoalIdsAnd,
          whereLevelFieldAnd: whereLevelFieldAnd,
          whereLevelFieldInclude: whereLevelFieldInclude,
          whereLocationAnd: whereLocationAnd,
          whereLocationInclude: whereLocationInclude,
          whereTypeIdsAnd: whereTypeIdsAnd,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(
            value.path,
            netwoerkHelper,
            maxStale,
            forceRefresh,
            checkInternet,
          );
        });
        response = await apiCall(
          netwoerkHelper,
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
          whereWorkoutNameContains: whereWorkoutNameContains,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereGoalIdsInclude: whereGoalIdsInclude,
          whereGoalIdIsEqualTo: whereGoalIdIsEqualTo,
          whereBodyPartsIdsInclude: whereBodyPartsIdsInclude,
          whereBodyPartIdIsEqualTo: whereBodyPartIdIsEqualTo,
          whereDurationIsEqualTo: whereDurationIsEqualTo,
          whereTypeIdsInclude: whereTypeIdsInclude,
          whereTypeIdIsEqualTo: whereTypeIdIsEqualTo,
          whereLocationIsEqualTo: whereLocationIsEqualTo,
          whereBodyPartsIdsAnd: whereBodyPartsIdsAnd,
          whereDurationAnd: whereDurationAnd,
          whereDurationIncludes: whereDurationIncludes,
          whereGoalIdsAnd: whereGoalIdsAnd,
          whereLevelFieldAnd: whereLevelFieldAnd,
          whereLevelFieldInclude: whereLevelFieldInclude,
          whereLocationAnd: whereLocationAnd,
          whereLocationInclude: whereLocationInclude,
          whereTypeIdsAnd: whereTypeIdsAnd,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        List<WorkoutModel> data = List.from(
            response.data['data'].map((e) => WorkoutModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

  static Future<Response<dynamic>> apiCall(NetwoerkHelper netwoerkHelper,
      {String? whereOrderingAccordingToNameEqualTo,
      String? whereLimitContentPerPageIsEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereWorkoutNameContains,
      String? whereLevelFieldEqualTo,
      String? whereGoalIdsInclude,
      String? whereGoalIdIsEqualTo,
      String? whereBodyPartsIdsInclude,
      String? whereBodyPartIdIsEqualTo,
      String? whereDurationIsEqualTo,
      String? whereTypeIdsInclude,
      String? whereTypeIdIsEqualTo,
      String? whereLocationIsEqualTo,
      String? whereGoalIdsAnd,
      String? whereBodyPartsIdsAnd,
      String? whereLevelFieldInclude,
      String? whereLevelFieldAnd,
      String? whereDurationIncludes,
      String? whereDurationAnd,
      String? whereTypeIdsAnd,
      String? whereLocationInclude,
      String? whereLocationAnd}) {
    return netwoerkHelper.getListOfWorkoutRequest(
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereWorkoutNameContains != null)
          "filter[where][q][contains]": whereWorkoutNameContains,
        if (whereGoalIdsAnd != null)
          "filter[where][goals][and]": whereGoalIdsAnd,
        if (whereGoalIdsInclude != null)
          "filter[where][goals][in]": whereGoalIdsInclude,
        if (whereGoalIdIsEqualTo != null)
          "filter[where][goals][eq]": whereGoalIdIsEqualTo,
        if (whereBodyPartsIdsAnd != null)
          "filter[where][body_parts][and]": whereBodyPartsIdsAnd,
        if (whereBodyPartsIdsInclude != null)
          "filter[where][body_parts][in]": whereBodyPartsIdsInclude,
        if (whereBodyPartIdIsEqualTo != null)
          "filter[where][body_parts][eq]": whereBodyPartIdIsEqualTo,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereLevelFieldInclude != null)
          "filter[where][level][in]": whereLevelFieldInclude,
        if (whereLevelFieldAnd != null)
          "filter[where][level][and]": whereLevelFieldAnd,
        if (whereDurationIsEqualTo != null)
          "filter[where][duration][eq]": whereDurationIsEqualTo,
        if (whereDurationIncludes != null)
          "filter[where][duration][in]": whereDurationIncludes,
        if (whereDurationAnd != null)
          "filter[where][duration][and]": whereDurationAnd,
        if (whereTypeIdsAnd != null)
          "filter[where][types][and]": whereTypeIdsAnd,
        if (whereTypeIdsInclude != null)
          "filter[where][types][in]": whereTypeIdsInclude,
        if (whereTypeIdIsEqualTo != null)
          "filter[where][types][eq]": whereTypeIdIsEqualTo,
        if (whereLocationIsEqualTo != null)
          "filter[where][locations][eq]": whereLocationIsEqualTo,
        if (whereLocationInclude != null)
          "filter[where][locations][in]": whereLocationInclude,
        if (whereLocationAnd != null)
          "filter[where][locations][and]": whereLocationAnd,
      },
    );
  }

  static Future<WorkoutModel?> workoutById(
      {required String id,
      Duration? maxAge,
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
        response = await netwoerkHelper.getWorkoutByIdRequest(
          id: id,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getWorkoutByIdRequest(
          id: id,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        WorkoutModel data = WorkoutModel.fromJson(response.data);
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
      bool? checkInternet) {
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
