part of funxtion_sdk;

class GetEquipmentRequest {
  Future<EquipmentModel?> getEquipmentById(int id) async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.getEquipmentApi + id.toString(),
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      EquipmentModel m = EquipmentModel.fromJson(response.data);
      return m;
    }
    return null;
  }
}
