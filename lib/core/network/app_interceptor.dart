part of network;

class _AppInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (SharedPreferenceService().accessToken.isNotEmpty) {
      final accessToken = SharedPreferenceService().accessToken;
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
      return super.onRequest(options, handler);
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
