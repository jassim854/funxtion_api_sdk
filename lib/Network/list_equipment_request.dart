part of funxtion_sdk;

class ListEquipmentRequest {
  Future<List<EquipmentModel>?> getListOfEquipment() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listEquipmentApi,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<EquipmentModel> m = List.from(
          response.data['data'].map((e) => EquipmentModel.fromJson(e)));
      return m;
    }
    return null;
  }
}
