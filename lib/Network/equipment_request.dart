
part of funxtion_sdk;

class EquipmentRequest {
static  Future<List<EquipmentModel>?> listOfEquipment() async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getListOfEquipmentRequest();
      if (response.statusCode == 200) {
        List<EquipmentModel> data = List.from(
            response.data['data'].map((e) => EquipmentModel.fromJson(e)));
        return data;
      }
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }

    return null;
  }

 static Future<EquipmentModel?> equipmentById(String id) async {
    NetwoerkHelper netwoerkHelper=NetwoerkHelper();
    try {
 _dioCacheManager = DioCacheManager(CacheConfig());
 netwoerkHelper.   dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await netwoerkHelper.getEquipmentByIdReques(id);
    if (response.statusCode == 200) {
      EquipmentModel data = EquipmentModel.fromJson(response.data);
      return data;
    }

    } on DioError catch (e) {

      throw convertDioErrorToRequestException(e);
    }
   
    return null;
  }
}
