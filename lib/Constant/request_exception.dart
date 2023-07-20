part of funxtion_sdk;

class RequestException implements Exception {
  DioError exception;

  RequestException(this.exception);
}

RequestException convertDioErrorToRequestException(DioError dioError) {
  return RequestException(dioError);
}
