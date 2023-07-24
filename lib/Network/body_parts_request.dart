part of funxtion_sdk;

class BodyPartsRequest {
  Future<List<BodyPartModel>?> bodyParts({Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getBodyPartsRequest(maxAge:maxAge?? const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale);
      if (response.statusCode == 200) {
        List<BodyPartModel> data = List.from(
            response.data['data'].map((e) => BodyPartModel.fromJson(e)));

        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }

  Future<BodyPartModel?> bodyPartById({required String id, Duration? maxAge ,bool?forceRefresh,Duration? maxStale}) async {
    NetwoerkHelper netwoerkHelper = NetwoerkHelper();
    try {
      _dioCacheManager = DioCacheManager(CacheConfig());
      netwoerkHelper.dio.interceptors.add(_dioCacheManager?.interceptor);
      var response = await netwoerkHelper.getABodyPartById(id: id, maxAge:maxAge??const Duration(days: 7),forceRefresh: forceRefresh??true,maxStale: maxStale );
      if (response.statusCode == 200) {
        BodyPartModel data = BodyPartModel.fromJson(response.data);
        return data;
      }
      return null;
    } on DioError catch (e) {
      throw convertDioErrorToRequestException(e);
    }
  }
}
