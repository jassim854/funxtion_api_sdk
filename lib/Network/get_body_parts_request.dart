part of funxtion_sdk;

class GetBodyPartsRequest {
  Future<List<BodyPartModel>?> getBodyParts() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getBodyPartsApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<BodyPartModel> m = List.from(
          response.data['data'].map((e) => BodyPartModel.fromJson(e)));

      return m;
    }
    return null;
  }
}
