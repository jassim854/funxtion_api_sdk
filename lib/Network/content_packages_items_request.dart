part of funxtion_sdk;

class ListContentPackageItemRequest {
  Future<ContentPackageItemsModel?> getListOfContentPackagesItem(
   {required String id, Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListContentPackageItemRequest( id: id, maxAge:maxAge??const Duration(days: 7) ,forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        ContentPackageItemsModel data =
            ContentPackageItemsModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
