part of funxtion_sdk;

class GetABodyPartsRequest {
  Future<BodyPartModel?> getBodyPartById(int id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getABodyPartsApi + id.toString(),
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      BodyPartModel m = BodyPartModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
