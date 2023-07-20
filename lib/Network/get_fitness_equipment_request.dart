part of funxtion_sdk;

class FitnessEquipmentRequest {
  Future<FitnessEquipmentCategoryModel?> getFitnessEquipmentById(
      context, int id) async {
    try {
      // _dioCacheManager = DioCacheManager(CacheConfig());
      // dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await dio.get(
        ConstantApis.getFitnessEquipmentCategoryApi + id.toString(),
        options: buildCacheOptions(const Duration(days: 7), forceRefresh: true),
      );
      if (response.statusCode == 200) {
        FitnessEquipmentCategoryModel m =
            FitnessEquipmentCategoryModel.fromJson(response.data);
        return m;
      }
    } on DioError catch (e) {
      NetwoerkHelper.showSnackbar(context, e.message.toString());
    }

    return null;
  }
}
