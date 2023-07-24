part of funxtion_sdk;

class ContentProviderCategoryOnDemandRequest {
  Future<ContentProvidersCategoryOnDemandModel?> contentProviders(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfContentProviderRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh??true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        ContentProvidersCategoryOnDemandModel data =
            ContentProvidersCategoryOnDemandModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  Future<ContentProvidersCategoryOnDemandModel?> contentCategory(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfContentCategoryRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh??true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        ContentProvidersCategoryOnDemandModel data =
            ContentProvidersCategoryOnDemandModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  Future<ContentProvidersCategoryOnDemandModel?> onDemandCategory(
      {Duration? maxAge, bool? forceRefresh, Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOnDemandCategoriesRequest(
          maxAge: maxAge ?? const Duration(days: 7),
          forceRefresh: forceRefresh??true,
          maxStale: maxStale);
      if (response.statusCode == 200) {
        ContentProvidersCategoryOnDemandModel data =
            ContentProvidersCategoryOnDemandModel.fromJson(response.data);

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
