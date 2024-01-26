import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'package:funxtion/funxtion_sdk.dart';

class NetworkHelper {
  late CacheStore? dioCacheManager;
  late Dio dio;

  NetworkHelper() {
    // dioCacheManager = HiveCacheStore('/data/user/0/com.example.example/cache');
    dio = Dio(BaseOptions(
      baseUrl: "https://api-staging.funxtion.com/v3/",
      headers: {
        'Content-Type': 'application/json',
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2OTg5MzAxNjAsImV4cCI6MTczMDQ2NjE2MCwianRpIjoiMDE4YjkwMjAtZjNkMi03MWI3LTlhMTQtMmEwM2I2OTMyYzhjIiwiZW1haWwiOiIwMThiOTAyMC1mM2QyLTcxYjctOWExNC0yYTAzYjY5MzJjOGMuYXBpX2NsaWVudEBmdW54dGlvbi5jb20iLCJzY29wZSI6ImFwaS1jbGllbnQiLCJvcmdJZCI6MTksImNvZGUiOiJldm9sdmVyc3RlY2gifQ.kZZUBTeyT6e1QyACbHFH3UNE23WHpKY7EPhJVLndWaUrIZTpF2CNcnf-VxlvEwWKDe9jvWXPd3mfpeMdqheEFCILAf8SjWwOKied44KKWb6VkjxaSZmtYREU3p_RyBSWFOwdnEHz8oqDw9gfKSvZh773dJUKK8-3q1S5Xe3jkayuJpgBUNumUVvuIbRJLINhwfA5M9yc3c-Zbv3nHTOvQkIJaCdywHXRe30urM-qz7KT3l_iqrw0e7VUZurHQFfEyH2V7pDqqTkoFTG5YlIpbL1TFh1SIH4Yl1ewG1E1LLTSkGfbX8oOmFICzxoQyxC1HeATtYZ3RnF6_j85A_s2_qyBNy5X7XrKaoCzkmO3Zj25nXiV1lNqSTz-X8_sTsFNiCW4CFNYppCrvLaKjwZfBZnbxEp1MKlj54OGy34vxR5_1XSa08Uxei_CwfdX9dto5RoXruDf7VP808pgdAwTdl6GKeiU5tpJ1xfTHmcyzvPgDXNV-t4ZhTE_Uqt84YQEZJOspIFF1mxNONjVJUAfM0axv_9LDXEeKlGx8MIrnlQHGYA19UfG2fzWa26YuFIMSt9NOb-SOpU8jN6V8AxZmpquKWdaDc5FNujQvdF4Jc5tj5KJP2BTkyaosbvmo75b7jOVUAFSK7vpgd9ZWWc99yiT8109kQnTgI7j-Eeuuz8"
      },
    ));
  }
  Future<Response> searchContentRequest({required Map data}) async {
    return await dio.post(
      ConstantApis.searchContentApi,
      data: data,
    );
  }

  Future<Response> getListOfExerciseRequest(
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(ConstantApis.listExerciseApi,
        queryParameters: queryParameters);
  }

  Future<Response> getExerciseByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getExerciseApi + id,
    );
  }

  Future<Response> getListOfWorkoutRequest(
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listWorkoutApi,
      queryParameters: queryParameters,
    );
  }

  Future<Response> getWorkoutByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getWorkoutApi + id,
    );
  }

  Future<Response> getWorkoutFilterRequest() async {
    return await dio.get(ConstantApis.getWorkoutFilterApi);
  }

  Future<Response> getListOfTrainingPlanRequest({
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(
      ConstantApis.listTrainingPlanApi,
      queryParameters: queryParameters,
    );
  }

  Future<Response> getTrainingPlanFilterRequest() async {
    return await dio.get(
      ConstantApis.getTrainingPlanFilterApi,
    );
  }

  Future<Response> getTrainingPlanByIdRequest({required String id}) async {
    return await dio.get(
      ConstantApis.getTrainingPlanApi + id,
    );
  }

  Future<Response> getListOfEquipmentRequest() async {
    return await dio.get(
      ConstantApis.listEquipmentApi,
    );
  }

  Future<Response> getListOfEquipmentBrandRequest() async {
    return await dio.get(
      ConstantApis.listEquipmentBrandApi,
    );
  }

  Future<Response> getEquipmentByIdReques({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getEquipmentApi + id,
    );
  }

  Future<Response> getListOfFitnessGoalRequest() async {
    return await dio.get(
      ConstantApis.listFitnessGoalApi,
    );
  }

  Future<Response> getFitnessGoalByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getFitnessGoalApi + id,
    );
  }

  Future<Response> getListOfInstructorsRequest() async {
    return await dio.get(
      ConstantApis.listInstructorApi,
    );
  }

  Future<Response> getInstructorByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getInstructorApi + id,
    );
  }

  Future<Response> getListOnDemandRequest(
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(
      ConstantApis.listOnDemandApi,
      queryParameters: queryParameters,
    );
  }

  Future<Response> getOnDemandFilterRequest() async {
    return await dio.get(
      ConstantApis.getOnDemandFilterApi,
    );
  }

  Future<Response> getOnDemandByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getOnDemandApi + id,
    );
  }

  Future<Response> getListOfContentProviderRequest() async {
    return await dio.get(
      ConstantApis.listContentProvidersApi,
    );
  }

  Future<Response> getListOfContentCategoryRequest(
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(ConstantApis.listContentCategoryApi,
        queryParameters: queryParameters);
  }

  Future<Response> getListOnDemandCategoriesRequest() async {
    return await dio.get(
      ConstantApis.listOnDemandCategoryApi,
    );
  }

  Future<Response> getListOfMuscleGroupRequest() async {
    return await dio.get(
      ConstantApis.listMuscleGroupApi,
    );
  }

  Future<Response> getFitnessActivitiesTypeRequest() async {
    return await dio.get(
      ConstantApis.getFitnessActivitiesTypeApi,
    );
  }

  Future<Response> getFitnessActivityTypeByIdrequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getFitnessActivityTypeApi + id,
    );
  }

  Future<Response> getBodyPartsRequest() async {
    return await dio.get(
      ConstantApis.getBodyPartsApi,
    );
  }

  Future<Response> getABodyPartById({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getABodyPartsApi + id,
    );
  }

  Future<Response> getListOfContentPackageRequest() async {
    return await dio.get(
      ConstantApis.listContentPackagesApi,
    );
  }

  Future<Response> getContentPackageById({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getContentPackagesApi + id,
    );
  }

  Future<Response> getListContentPackageItemRequest({
    required String id,
  }) async {
    return await dio.get(
      "${ConstantApis.listContentPackageItemApi}$id/items",
    );
  }
}
