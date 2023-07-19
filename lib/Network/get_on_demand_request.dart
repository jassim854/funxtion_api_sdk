part of funxtion_sdk;

class GetOnDemandRequest {
  Future<OnDemandModel?> getOnDemandById(String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getOnDemandApi + id,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      OnDemandModel m = OnDemandModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
