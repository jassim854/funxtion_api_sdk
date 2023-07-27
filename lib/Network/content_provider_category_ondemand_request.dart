part of funxtion_sdk;

class ContentProviderCategoryOnDemandRequest {
  static Future< List<ContentProvidersCategoryOnDemandModel> ?> contentProviders(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfContentProviderRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        List<ContentProvidersCategoryOnDemandModel> data = List.from(
            response.data['data'].map((e) => ContentProvidersCategoryOnDemandModel.fromJson(e)));
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future< List<ContentProvidersCategoryOnDemandModel> ?> contentCategory(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfContentCategoryRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh ?? true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
         List<ContentProvidersCategoryOnDemandModel> data = List.from(
            response.data['data'].map((e) => ContentProvidersCategoryOnDemandModel.fromJson(e)));
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  static Future< List<ContentProvidersCategoryOnDemandModel> ?> onDemandCategory({
    Duration? maxAge,
    bool? forceRefresh,
    Duration? maxStale,
    String? whereIdIsEqualTo,
    String? whereIdsAre,
    String? whereLimitContentPerPageIsEqualTo,
    String? whereNameIsEqualTo,
    String? whereOrderingAccordingToNameEqualTo,
    String? wherePageNumberIsEqualTo,
    String? whereSlugNameIsEqualTo,
      }) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOnDemandCategoriesRequest(
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
        if (whereNameIsEqualTo != null)
          "filter[where][name][eq]": whereNameIsEqualTo,
        if (whereSlugNameIsEqualTo != null)
          "filter[where][slug][eq]": whereSlugNameIsEqualTo,
      },
      );
      if (response.statusCode == 200) {
   List<ContentProvidersCategoryOnDemandModel> data = List.from(
            response.data['data'].map((e) => ContentProvidersCategoryOnDemandModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
