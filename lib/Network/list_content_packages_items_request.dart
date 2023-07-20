part of funxtion_sdk;

class ListContentPackageItemRequest {
  Future<ContentPackageItemsModel?> getListOfContentPackagesItem(
      String id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      "${ConstantApis.listContentPackageItemApi}$id/items",
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      ContentPackageItemsModel m =
          ContentPackageItemsModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
