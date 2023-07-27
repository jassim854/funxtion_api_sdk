part of funxtion_sdk;

class FitnessEquipmentCategoryRequest {
  static Future<List<FitnessEquipmentCategoryModel>?>
      listOfFitnessEquipmentCategories({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereNameContains,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereSlugNameIsEqualTo,
  }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response =
          await netwoerkHelper.getListOfFitnessEquipmentCategoriesRequest(
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
        if (whereIdIsEqualTo != null) "filter[where][id][eq]": whereIdIsEqualTo,
        if (whereIdsAre != null) "filter[where][id][in]": whereIdsAre,
        if (whereNameContains != null)
          "filter[where][name][contains]": whereNameContains,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
      );
      if (response.statusCode == 200) {
        List<FitnessEquipmentCategoryModel> data = List.from(response
            .data['data']
            .map((e) => FitnessEquipmentCategoryModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

  static Future<FitnessEquipmentCategoryModel?> fitnessEquipmentCategoryById(
      {required String id,
      Duration? maxAge,
      bool? forceRefresh,
      Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getFitnessEquipmentCategoryRequest(
          id: id,
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        FitnessEquipmentCategoryModel data =
            FitnessEquipmentCategoryModel.fromJson(response.data);
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }
}
