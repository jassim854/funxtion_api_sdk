import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class TrainingPlanRequest {
  static Future<List<TrainingPlanModel>?> listOfTrainingPlan({
    bool forceRefresh = true,
    Duration maxStale = const Duration(days: 7),
    String? whereOrderingAccordingToNameEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereNameContains,
    String? whereLevelFieldEqualTo,
    String? whereGoalIdsInclude,
    String? whereGoalIdIsEqualTo,
    String? whereDaysPerWeekIsEqualTo,
    String? whereLocationIsEqualTo,
    String? whereGoalIdsAnd,
    String? whereLevelFieldInclude,
    String? whereLevelFieldAnd,
    String? whereLocationInclude,
    String? whereLocationAnd,
    String? whereDaysPerWeekInclude,
    String? whereDaysPerWeekAnd,
  }) async {
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
          whereDaysPerWeekAnd: whereDaysPerWeekAnd,
          whereDaysPerWeekInclude: whereDaysPerWeekInclude,
          whereDaysPerWeekIsEqualTo: whereDaysPerWeekIsEqualTo,
          whereGoalIdIsEqualTo: whereGoalIdIsEqualTo,
          whereGoalIdsAnd: whereGoalIdsAnd,
          whereGoalIdsInclude: whereGoalIdsInclude,
          whereLevelFieldAnd: whereLevelFieldAnd,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereLevelFieldInclude: whereLevelFieldInclude,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          whereLocationAnd: whereLocationAnd,
          whereLocationInclude: whereLocationInclude,
          whereLocationIsEqualTo: whereLocationIsEqualTo,
          whereNameContains: whereNameContains,
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await apiCall(
          netwoerkHelper,
          whereDaysPerWeekAnd: whereDaysPerWeekAnd,
          whereDaysPerWeekInclude: whereDaysPerWeekInclude,
          whereDaysPerWeekIsEqualTo: whereDaysPerWeekIsEqualTo,
          whereGoalIdIsEqualTo: whereGoalIdIsEqualTo,
          whereGoalIdsAnd: whereGoalIdsAnd,
          whereGoalIdsInclude: whereGoalIdsInclude,
          whereLevelFieldAnd: whereLevelFieldAnd,
          whereLevelFieldEqualTo: whereLevelFieldEqualTo,
          whereLevelFieldInclude: whereLevelFieldInclude,
          whereLimitContentPerPageIsEqualTo: whereLimitContentPerPageIsEqualTo,
          whereLocationAnd: whereLocationAnd,
          whereLocationInclude: whereLocationInclude,
          whereLocationIsEqualTo: whereLocationIsEqualTo,
          whereNameContains: whereNameContains,
          whereOrderingAccordingToNameEqualTo:
              whereOrderingAccordingToNameEqualTo,
          wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        List<TrainingPlanModel> data = List.from(
            response.data['data'].map((e) => TrainingPlanModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

  static Future<Response<dynamic>> apiCall(
    NetwoerkHelper netwoerkHelper, {
    String? whereOrderingAccordingToNameEqualTo,
    String? whereLimitContentPerPageIsEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereNameContains,
    String? whereLevelFieldEqualTo,
    String? whereGoalIdsInclude,
    String? whereGoalIdIsEqualTo,
    String? whereDaysPerWeekIsEqualTo,
    String? whereLocationIsEqualTo,
    String? whereGoalIdsAnd,
    String? whereLevelFieldInclude,
    String? whereLevelFieldAnd,
    String? whereLocationInclude,
    String? whereLocationAnd,
    String? whereDaysPerWeekInclude,
    String? whereDaysPerWeekAnd,
  }) {
    return netwoerkHelper.getListOfTrainingPlanRequest(
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereNameContains != null)
          "filter[where][q][contains]": whereNameContains,
        if (whereGoalIdsInclude != null)
          "filter[where][goals][in]": whereGoalIdsInclude,
        if (whereGoalIdIsEqualTo != null)
          "filter[where][goals][eq]": whereGoalIdIsEqualTo,
        if (whereGoalIdsAnd != null)
          "filter[where][goals][and]": whereGoalIdsAnd,
        if (whereLevelFieldInclude != null)
          "filter[where][level][in]": whereLevelFieldInclude,
        if (whereLevelFieldAnd != null)
          "filter[where][level][and]": whereLevelFieldAnd,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereLocationInclude != null)
          "filter[where][locations][in]": whereLocationInclude,
        if (whereLocationIsEqualTo != null)
          "filter[where][locations][eq]": whereLocationIsEqualTo,
        if (whereLocationAnd != null)
          "filter[where][locations][and]": whereLocationAnd,
        if (whereDaysPerWeekIsEqualTo != null)
          "filter[where][max_days_per_week][eq]": whereDaysPerWeekIsEqualTo,
        if (whereDaysPerWeekInclude != null)
          "filter[where][max_days_per_week][in]": whereDaysPerWeekInclude,
        if (whereDaysPerWeekAnd != null)
          "filter[where][max_days_per_week][and]": whereDaysPerWeekAnd,
      },
    );
  }

  static Future<TrainingPlanModel?> trainingPlanById(
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
        response = await netwoerkHelper.getTrainingPlanByIdRequest(
          id: id,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getTrainingPlanByIdRequest(
          id: id,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        TrainingPlanModel data = TrainingPlanModel.fromJson(response.data);
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
  ) async {
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
