part of funxtion_sdk;

class ListFitnessEquipmentRequest {
  Future<List<FitnessEquipmentCategoryModel>?>
      getListOfFitnessEquipment() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listFitnessEquipmentCategoriesApi,
      options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<FitnessEquipmentCategoryModel> m = List.from(response.data['data']
          .map((e) => FitnessEquipmentCategoryModel.fromJson(e)));
      return m;
    }
    return null;
  }
}
