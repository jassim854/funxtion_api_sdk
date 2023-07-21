part of funxtion_sdk;

class ListOnDemandRequest {
  Future<List<OnDemandModel>?> getListOnDemand() async {
    return null;
  
  //   // _dioCacheManager = DioCacheManager(CacheConfig());
  //   // dio.interceptors.add(_dioCacheManager?.interceptor);
  //   var response = await dio.get(
  //     ConstantApis.listOnDemandApi,
  //     options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
  //   );
  //   if (response.statusCode == 200) {
  //     List<OnDemandModel> m = List.from(
  //         response.data['data'].map((e) => OnDemandModel.fromJson(e)));

  //     return m;
  //   }
  //   return null;
  }
}
