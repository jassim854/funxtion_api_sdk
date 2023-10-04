import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../funxtion_sdk.dart';

class OnDemandRequest {
  static Future<List<OnDemandModel>?> listOnDemand(
      {bool forceRefresh = true,
      Duration maxStale = const Duration(days: 7),
      String? whereOrderingAccordingToNameEqualTo,
      String? whereLimitContentPerPageIsEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereInstructorsIdsInclude,
      String? whereInstructorsIdIsEqualTo,
      String? whereContentProviderIdIsEqualTo,
      String? whereEquipmentIdsIncludes,
      String? whereEquipmentIdIsEqualTo,
      String? whereTypeIsEqualTo,
      String? whereCategoriesIdInclude,
      String? whereCategoriesIdIsEqualTo,
      String? whereLevelFieldEqualTo,
      String? whereDurationIncludes,
      String? whereNameIsEqualTo,
      String? whereDurationAnd,
      String? whereDurationEqualTo,
      String? whereLevelFieldAnd,
      String? whereLevelFieldIncludes,
      String? whereCategoriesIdsAnd,
      String? whereTypeInclude,
      String? whereTypeAnd,
      String? whereEquipmentIdsAnd,
      String? whereContentProviderIdsIncludes,
      String? whereContentProviderIdsAnd,
      String? whereInstructorsIdsAnd}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    Response<dynamic>? response;
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
        response = await apiCall(netwoerkHelper,
            whereOrderingAccordingToNameEqualTo:
                whereOrderingAccordingToNameEqualTo,
            whereLimitContentPerPageIsEqualTo:
                whereLimitContentPerPageIsEqualTo,
            wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
            whereInstructorsIdsInclude: whereInstructorsIdsInclude,
            whereInstructorsIdIsEqualTo: whereInstructorsIdIsEqualTo,
            whereContentProviderIdIsEqualTo: whereContentProviderIdIsEqualTo,
            whereEquipmentIdsIncludes: whereEquipmentIdsIncludes,
            whereEquipmentIdIsEqualTo: whereEquipmentIdIsEqualTo,
            whereTypeIsEqualTo: whereTypeIsEqualTo,
            whereCategoriesIdInclude: whereCategoriesIdInclude,
            whereCategoriesIdIsEqualTo: whereCategoriesIdIsEqualTo,
            whereLevelFieldEqualTo: whereLevelFieldEqualTo,
            whereDurationIncludes: whereDurationIncludes,
            whereNameIsEqualTo: whereNameIsEqualTo,
            whereDurationAnd: whereDurationAnd,
            whereDurationEqualTo: whereDurationEqualTo,
            whereLevelFieldAnd: whereLevelFieldAnd,
            whereLevelFieldIncludes: whereLevelFieldIncludes,
            whereCategoriesIdsAnd: whereCategoriesIdsAnd,
            whereTypeInclude: whereTypeInclude,
            whereTypeAnd: whereTypeAnd,
            whereContentProviderIdsAnd: whereContentProviderIdsAnd,
            whereContentProviderIdsIncludes: whereContentProviderIdsIncludes,
            whereEquipmentIdsAnd: whereEquipmentIdsAnd,
            whereInstructorsIdsAnd: whereInstructorsIdsAnd);
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await apiCall(netwoerkHelper,
            whereOrderingAccordingToNameEqualTo:
                whereOrderingAccordingToNameEqualTo,
            whereLimitContentPerPageIsEqualTo:
                whereLimitContentPerPageIsEqualTo,
            wherePageNumberIsEqualTo: wherePageNumberIsEqualTo,
            whereInstructorsIdsInclude: whereInstructorsIdsInclude,
            whereInstructorsIdIsEqualTo: whereInstructorsIdIsEqualTo,
            whereContentProviderIdIsEqualTo: whereContentProviderIdIsEqualTo,
            whereEquipmentIdsIncludes: whereEquipmentIdsIncludes,
            whereEquipmentIdIsEqualTo: whereEquipmentIdIsEqualTo,
            whereTypeIsEqualTo: whereTypeIsEqualTo,
            whereCategoriesIdInclude: whereCategoriesIdInclude,
            whereCategoriesIdIsEqualTo: whereCategoriesIdIsEqualTo,
            whereLevelFieldEqualTo: whereLevelFieldEqualTo,
            whereDurationIncludes: whereDurationIncludes,
            whereNameIsEqualTo: whereNameIsEqualTo,
            whereDurationAnd: whereDurationAnd,
            whereDurationEqualTo: whereDurationEqualTo,
            whereLevelFieldAnd: whereLevelFieldAnd,
            whereLevelFieldIncludes: whereLevelFieldIncludes,
            whereCategoriesIdsAnd: whereCategoriesIdsAnd,
            whereTypeInclude: whereTypeInclude,
            whereTypeAnd: whereTypeAnd,
            whereContentProviderIdsAnd: whereContentProviderIdsAnd,
            whereContentProviderIdsIncludes: whereContentProviderIdsIncludes,
            whereEquipmentIdsAnd: whereEquipmentIdsAnd,
            whereInstructorsIdsAnd: whereInstructorsIdsAnd);
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        List<OnDemandModel> data = List.from(
            response.data['data'].map((e) => OnDemandModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<Response<dynamic>> apiCall(NetwoerkHelper netwoerkHelper,
      {String? whereOrderingAccordingToNameEqualTo,
      String? whereLimitContentPerPageIsEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereInstructorsIdsInclude,
      String? whereInstructorsIdIsEqualTo,
      String? whereContentProviderIdIsEqualTo,
      String? whereEquipmentIdsIncludes,
      String? whereEquipmentIdIsEqualTo,
      String? whereTypeIsEqualTo,
      String? whereCategoriesIdInclude,
      String? whereCategoriesIdIsEqualTo,
      String? whereLevelFieldEqualTo,
      String? whereDurationIncludes,
      String? whereNameIsEqualTo,
      String? whereDurationAnd,
      String? whereDurationEqualTo,
      String? whereLevelFieldAnd,
      String? whereLevelFieldIncludes,
      String? whereCategoriesIdsAnd,
      String? whereTypeInclude,
      String? whereTypeAnd,
      String? whereEquipmentIdsAnd,
      String? whereContentProviderIdsIncludes,
      String? whereContentProviderIdsAnd,
      String? whereInstructorsIdsAnd}) {
    return netwoerkHelper.getListOnDemandRequest(
      queryParameters: {
        if (whereOrderingAccordingToNameEqualTo != null)
          "filter[order][name]": whereOrderingAccordingToNameEqualTo,
        if (whereLimitContentPerPageIsEqualTo != null)
          "filter[limit]": whereLimitContentPerPageIsEqualTo,
        if (wherePageNumberIsEqualTo != null)
          "filter[offset]": wherePageNumberIsEqualTo,
        if (whereInstructorsIdsAnd != null)
          "filter[where][instructor][and]": whereInstructorsIdsAnd,
        if (whereInstructorsIdsInclude != null)
          "filter[where][instructor][in]": whereInstructorsIdsInclude,
        if (whereInstructorsIdIsEqualTo != null)
          "filter[where][instructor][eq]": whereInstructorsIdIsEqualTo,
        if (whereContentProviderIdIsEqualTo != null)
          "filter[where][content_provider][eq]":
              whereContentProviderIdIsEqualTo,
        if (whereContentProviderIdsIncludes != null)
          "filter[where][content_provider][in]":
              whereContentProviderIdsIncludes,
        if (whereContentProviderIdsAnd != null)
          "filter[where][content_provider][and]": whereContentProviderIdsAnd,
        if (whereEquipmentIdsAnd != null)
          "filter[where][equipment][and]": whereEquipmentIdsAnd,
        if (whereEquipmentIdsIncludes != null)
          "filter[where][equipment][in]": whereEquipmentIdsIncludes,
        if (whereEquipmentIdIsEqualTo != null)
          "filter[where][equipment][eq]": whereEquipmentIdIsEqualTo,
        if (whereTypeInclude != null)
          "filter[where][type][in]": whereTypeInclude,
        if (whereTypeAnd != null) "filter[where][type][and]": whereTypeAnd,
        if (whereTypeIsEqualTo != null)
          "filter[where][type][eq]": whereTypeIsEqualTo,
        if (whereCategoriesIdsAnd != null)
          "filter[where][categories][and]": whereCategoriesIdsAnd,
        if (whereCategoriesIdInclude != null)
          "filter[where][categories][in]": whereCategoriesIdInclude,
        if (whereCategoriesIdIsEqualTo != null)
          "filter[where][categories][eq]": whereCategoriesIdIsEqualTo,
        if (whereLevelFieldIncludes != null)
          "filter[where][level][in]": whereLevelFieldIncludes,
        if (whereLevelFieldAnd != null)
          "filter[where][level][and]": whereLevelFieldAnd,
        if (whereLevelFieldEqualTo != null)
          "filter[where][level][eq]": whereLevelFieldEqualTo,
        if (whereDurationEqualTo != null)
          "filter[where][duration][eq]": whereDurationEqualTo,
        if (whereDurationAnd != null)
          "filter[where][duration][and]": whereDurationAnd,
        if (whereDurationIncludes != null)
          "filter[where][duration][in]": whereDurationIncludes,
        if (whereNameIsEqualTo != null)
          "filter[where][q][contains]": whereNameIsEqualTo,
      },
    );
  }

  static Future<OnDemandModel?> onDemandById(
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
        response = await netwoerkHelper.getOnDemandByIdRequest(
          id: id,
        );
      } else {
        await getTemporaryDirectory().then((value) async {
          _addDioCacheInterceptor(value.path, netwoerkHelper, maxStale,
              forceRefresh, checkInternet);
        });
        response = await netwoerkHelper.getOnDemandByIdRequest(
          id: id,
        );
      }

      if (response.statusCode == 200 || response.statusCode == 304) {
        OnDemandModel data = OnDemandModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
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
            maxStale: maxStale,
            priority: CachePriority.high,
            policy: checkInternet == true && forceRefresh == true
                ? CachePolicy.refreshForceCache
                : CachePolicy.forceCache)));
  }
}
