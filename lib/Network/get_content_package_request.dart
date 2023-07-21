part of funxtion_sdk;

class GetContentPackageRequest {
  Future<ContentPackageModel?> getContentPackagetById(String id) async {
    return null;
  
  //   // _dioCacheManager = DioCacheManager(CacheConfig());
  //   // dio.interceptors.add(_dioCacheManager?.interceptor);
  //   var response = await dio.get(
  //     ConstantApis.getContentPackagesApi + id,
  //     options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
  //   );
  //   if (response.statusCode == 200) {
  //     ContentPackageModel m = ContentPackageModel.fromJson(response.data);
  //     return m;
  //   }
  //   return null;
  }
}
