import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'package:funxtion/funxtion_sdk.dart';

class NetwoerkHelper {
  late CacheStore? dioCacheManager;
  late Dio dio;

  NetwoerkHelper() {
    // dioCacheManager = HiveCacheStore('/data/user/0/com.example.example/cache');
    dio = Dio(BaseOptions(
      baseUrl: "https://api-staging.funxtion.com/v3/",
      headers: {
        "X-Scope": "platform",
        'Content-Type': 'application/json',
        "Authorization": AuthRequest.getToken != "null"
            ? "Bearer ${AuthRequest.getToken}"
            : ''
      },
    ));
  }

  Future<Response> postAuthRequest({
    required String username,
    required String password,
  }) async {
    return await dio.post(
      ConstantApis.loginApi,
      data: {"username": username, "password": password},
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

  Future<Response> getListOfContentCategoryRequest() async {
    return await dio.get(
      ConstantApis.listContentCategoryApi,
    );
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
