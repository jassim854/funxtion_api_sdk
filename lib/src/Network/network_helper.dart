import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'package:funxtion/funxtion_sdk.dart';

class NetworkHelper {
  late CacheStore? dioCacheManager;
  late Dio dio;

  NetworkHelper() {
    dio = Dio(BaseOptions(
      baseUrl: "https://api-staging.funxtion.com/v3/",
      headers: {
        'Content-Type': 'application/json',
        "Authorization": BearerToken.getToken != "null"
            ? "Bearer ${BearerToken.getToken}"
            : ''
      },
    ));
  }
  Future<Response> searchContentRequest(
      {required Map<String, dynamic> data}) async {
    Map<String, dynamic> newData = {};
    newData.addAll(data);
    if (ContentPackage.getContentPackageId != null) {
      newData.addAll({"content_package": ContentPackage.getContentPackageId});
    }

    return await dio.post(
      ConstantApis.searchContentApi,
      data: newData,
    );
  }

  Future<Response> getListOfExerciseRequest(
      {Map<String, dynamic>? queryParameters}) async {
    Map<String, dynamic>? newParams = {};
    newParams.addAll(queryParameters ?? {});
    if (ContentPackage.getContentPackageId != null) {
      newParams.addAll({"content_package": ContentPackage.getContentPackageId});
    }

    return await dio.get(ConstantApis.listExerciseApi,
        queryParameters: newParams);
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
    Map<String, dynamic>? newParams = {};
    newParams.addAll(queryParameters ?? {});
    if (ContentPackage.getContentPackageId != null) {
      newParams.addAll({"content_package": ContentPackage.getContentPackageId});
    }
    return await dio.get(
      ConstantApis.listWorkoutApi,
      queryParameters: newParams,
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
    return await dio.get(ConstantApis.getWorkoutFilterApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getListOfTrainingPlanRequest({
    Map<String, dynamic>? queryParameters,
  }) async {
    Map<String, dynamic>? newParams = {};
    newParams.addAll(queryParameters ?? {});
    if (ContentPackage.getContentPackageId != null) {
      newParams.addAll({"content_package": ContentPackage.getContentPackageId});
    }
    return await dio.get(
      ConstantApis.listTrainingPlanApi,
      queryParameters: newParams,
    );
  }

  Future<Response> getTrainingPlanFilterRequest() async {
    return await dio
        .get(ConstantApis.getTrainingPlanFilterApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getTrainingPlanByIdRequest({required String id}) async {
    return await dio.get(
      ConstantApis.getTrainingPlanApi + id,
    );
  }

  Future<Response> getListOfEquipmentRequest() async {
    return await dio.get(ConstantApis.listEquipmentApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getListOfEquipmentBrandRequest() async {
    return await dio.get(ConstantApis.listEquipmentBrandApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getEquipmentByIdReques({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getEquipmentApi + id,
    );
  }

  Future<Response> getListOfFitnessGoalRequest() async {
    return await dio.get(ConstantApis.listFitnessGoalApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getFitnessGoalByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getFitnessGoalApi + id,
    );
  }

  Future<Response> getListOfInstructorsRequest() async {
    return await dio.get(ConstantApis.listInstructorApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
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
    Map<String, dynamic>? newParams = {};
    newParams.addAll(queryParameters ?? {});
    if (ContentPackage.getContentPackageId != null) {
      newParams.addAll({"content_package": ContentPackage.getContentPackageId});
    }
    return await dio.get(
      ConstantApis.listOnDemandApi,
      queryParameters: newParams,
    );
  }

  Future<Response> getOnDemandFilterRequest() async {
    return await dio.get(ConstantApis.getOnDemandFilterApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getOnDemandByIdRequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getOnDemandApi + id,
    );
  }

  Future<Response> getListOfContentProviderRequest() async {
    return await dio
        .get(ConstantApis.listContentProvidersApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getListOfContentCategoryRequest(
      {Map<String, dynamic>? queryParameters}) async {
    Map<String, dynamic>? newParams = {};
    newParams.addAll(queryParameters ?? {});
    if (ContentPackage.getContentPackageId != null) {
      newParams.addAll({"content_package": ContentPackage.getContentPackageId});
    }
    return await dio.get(ConstantApis.listContentCategoryApi,
        queryParameters: newParams);
  }

  Future<Response> getListOnDemandCategoriesRequest() async {
    return await dio
        .get(ConstantApis.listOnDemandCategoryApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getListOfMuscleGroupRequest() async {
    return await dio.get(ConstantApis.listMuscleGroupApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getFitnessActivitiesTypeRequest() async {
    return await dio
        .get(ConstantApis.getFitnessActivitiesTypeApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getFitnessActivityTypeByIdrequest({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getFitnessActivityTypeApi + id,
    );
  }

  Future<Response> getBodyPartsRequest() async {
    return await dio.get(ConstantApis.getBodyPartsApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
  }

  Future<Response> getABodyPartById({
    required String id,
  }) async {
    return await dio.get(
      ConstantApis.getABodyPartsApi + id,
    );
  }

  Future<Response> getListOfContentPackageRequest() async {
    return await dio.get(ConstantApis.listContentPackagesApi, queryParameters: {
      if (ContentPackage.getContentPackageId != null)
        "content_package": ContentPackage.getContentPackageId
    });
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
