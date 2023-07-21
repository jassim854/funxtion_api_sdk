part of funxtion_sdk;

class FitnessEquipmentCategoryRequest {
 static Future<List<FitnessEquipmentCategoryModel>?>
      listOfFitnessEquipmentCategories() async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response =
          await netwoerkHelper.getListOfFitnessEquipmentCategoriesRequest();
      if (response.statusCode == 200) {
        List<FitnessEquipmentCategoryModel> data = List.from(response
            .data['data']
            .map((e) => FitnessEquipmentCategoryModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

static  Future<FitnessEquipmentCategoryModel?> fitnessEquipmentCategoryById(
     String id) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response =
          await netwoerkHelper.getFitnessEquipmentCategoryRequest(id);
      if (response.statusCode == 200) {
        FitnessEquipmentCategoryModel m =
            FitnessEquipmentCategoryModel.fromJson(response.data);
        return m;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }
}
