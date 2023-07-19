part of funxtion_sdk;

class ListExerciseRequest {
  Future<List<ExerciseModel>?> getListOfExercise() async {
    // _dioCacheManager = DioCacheManager(CacheConfig());
    // dio.interceptors.add(_dioCacheManager?.interceptor);
    var response = await dio.get(
      ConstantApis.listExerciseApi,
      options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
    );
    if (response.statusCode == 200) {
      List<ExerciseModel> listExercises = List<ExerciseModel>.from(
          response.data["data"].map((x) => ExerciseModel.fromJson(x)));

      return listExercises;
    }
  }
}
