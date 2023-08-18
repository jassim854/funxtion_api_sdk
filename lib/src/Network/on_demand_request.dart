import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../funxtion_sdk.dart';

class OnDemandRequest {
  static Future<List<OnDemandModel>?> listOnDemand(
      {Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale,
      String? whereCategoriesIdIsEqualTo,
      String? whereCategoriesIdsAre,
      String? whereDurationIsEqualTo,
      String? whereEquipmentIdIsEqualTo,
      String? whereEquipmentIdsAre,
      String? whereInstructorsIdIsEqualTo,
      String? whereInstructorsIdsAre,
      String? whereLimitContentPerPageIsEqualTo,
      String? whereLocationIsEqualTo,
      String? whereNameIsEqualTo,
      String? whereOrderingAccordingToNameEqualTo,
      String? wherePageNumberIsEqualTo,
      String? whereLevelFieldEqualTo,
      String? fuzzyFilterSearch}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getListOnDemandRequest(
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
          if (whereLocationIsEqualTo != null)
            "filter[where][location][eq]": whereLocationIsEqualTo,
          if (whereDurationIsEqualTo != null)
            "filter[where][duration][in]": whereDurationIsEqualTo,
          if (whereInstructorsIdsAre != null)
            "filter[where][instructor_id][in]": whereInstructorsIdsAre,
          if (whereInstructorsIdIsEqualTo != null)
            "filter[where][instructor_id][eq]": whereInstructorsIdIsEqualTo,
          if (whereCategoriesIdsAre != null)
            "filter[where][categories][in]": whereCategoriesIdsAre,
          if (whereCategoriesIdIsEqualTo != null)
            "filter[where][categories][eq]": whereCategoriesIdIsEqualTo,
          if (whereNameIsEqualTo != null)
            "filter[where][title][contains]": whereNameIsEqualTo,
          if (whereEquipmentIdsAre != null)
            "filter[where][equipment.ids][in]": whereEquipmentIdsAre,
          if (whereEquipmentIdIsEqualTo != null)
            "filter[where][equipment.ids][eq]": whereEquipmentIdIsEqualTo,
          if (whereLevelFieldEqualTo != null)
            "filter[where][level][eq]": whereLevelFieldEqualTo,
          if (fuzzyFilterSearch != null) "filter[where][q]": fuzzyFilterSearch,
        },
      );
      if (response.statusCode == 200) {
        List<OnDemandModel> data = List.from(
            response.data['data'].map((e) => OnDemandModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future<OnDemandModel?> onDemandById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(dioCacheManager.interceptor);
      var response = await netwoerkHelper.getOnDemandByIdRequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        OnDemandModel data = OnDemandModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
