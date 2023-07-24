
part of funxtion_sdk;

class ContentPackageRequest {
  Future<List<ContentPackageModel>?> listOfContentPackages({ Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfContentPackageRequest(
maxAge: maxAge??const Duration(days: 7),
forceRefresh: forceRefresh??true,
maxStale: maxStale
      );
      if (response.statusCode == 200) {
        List<ContentPackageModel> m = List.from(
            response.data['data'].map((e) => ContentPackageModel.fromJson(e)));
        return m;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  Future<ContentPackageModel?> contentPackagetById({required String id, Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getContentPackageById(id: id,maxAge: maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        ContentPackageModel data = ContentPackageModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
