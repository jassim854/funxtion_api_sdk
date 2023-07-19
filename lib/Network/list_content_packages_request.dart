part of funxtion_sdk;

class ListContentPackageRequest {
  Future<List<ContentPackageModel>?> getListOfContentPackages() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listContentPackagesApi,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<ContentPackageModel> m = List.from(
          response.data['data'].map((e) => ContentPackageModel.fromJson(e)));
      return m;
    }
    return null;
  }
}
