
part of funxtion_sdk;

class OnDemandRequest {
  Future<List<OnDemandModel>?> listOnDemand({ Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOnDemandRequest(
maxAge: maxAge??const Duration(days: 7),
forceRefresh: forceRefresh??true,
maxStale: maxStale
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

  Future<OnDemandModel?> onDemandById({required String id, Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getOnDemandByIdRequest(id: id,maxAge: maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
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
