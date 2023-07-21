part of funxtion_sdk;

class ListContentProviderRequest {
  Future<ContentProvidersCategoryOnDemandModel?>
      getListOfContentProviders() async {
        return null;
      
  //   // _dioCacheManager = DioCacheManager(CacheConfig());
  //   // dio.interceptors.add(_dioCacheManager?.interceptor);
  //   var response = await dio.get(
  //     ConstantApis.listContentProvidersApi,
  //     options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
  //   );
  //   if (response.statusCode == 200) {
  //     ContentProvidersCategoryOnDemandModel m =
  //         ContentProvidersCategoryOnDemandModel.fromJson(response.data);
  //     return m;
  //   }
  //   return null;
  }
}
