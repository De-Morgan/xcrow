part of network;

class NetworkProvider {
  static const CONNECT_TIME_OUT = Duration(seconds: 30);
  static const RECEIVE_TIME_OUT = Duration(seconds: 40);
  final Dio _dio;

  NetworkProvider({Dio? dio})
      : _dio = dio ?? Dio(_defaultOpts)
          ..interceptors.addAll([
            _AppInterceptor(),
            if (kDebugMode)
              LogInterceptor(
                requestBody: true,
                responseBody: true,
              ),
          ]);

  NetworkProvider._internal({Dio? dio})
      : _dio = dio ?? Dio(_defaultOpts)
          ..interceptors.addAll([
            if (kDebugMode)
              LogInterceptor(
                requestBody: true,
                responseBody: true,
              ),
          ]);

  factory NetworkProvider.noInterceptor({Map<String, dynamic>? headers}) =>
      NetworkProvider._internal(
          dio: Dio(
        _defaultOpts.copyWith(headers: headers),
      ));

  factory NetworkProvider.fromBaseUrl(String baseUrl) => NetworkProvider(
          dio: Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: CONNECT_TIME_OUT,
        receiveTimeout: RECEIVE_TIME_OUT,
      )));

  factory NetworkProvider.fromBaseUrlNoInterceptor(String baseUrl) =>
      NetworkProvider._internal(
          dio: Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: CONNECT_TIME_OUT,
        receiveTimeout: RECEIVE_TIME_OUT,
      )));

  static BaseOptions get _defaultOpts {
    return BaseOptions(
      baseUrl: EnvironmentConfig.baseUrl,
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
    );
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      ProgressCallback? onSendProgress,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      return await _dio.post(path,
          data: body,
          queryParameters: queryParameters,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
  }) async {
    try {
      return await _dio.get(path,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: progressCallback);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.put(path, data: body, queryParameters: queryParameters);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> patch(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.patch(path,
          data: body, queryParameters: queryParameters);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.delete(path,
          data: body, queryParameters: queryParameters);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> uploadMedia(
    String filePath, {
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onUploadProgress,
    String? folder,
    CancelToken? cancelToken,
  }) async {
    try {
      folder ??= 'mobile';
      final body = {
        'media': await MultipartFile.fromFile(filePath,
            filename: filePath.split('/').last)
      };
      return await _dio.post('/upload/$folder',
          data: FormData.fromMap(body),
          cancelToken: cancelToken,
          queryParameters: queryParameters,
          onSendProgress: onUploadProgress);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }

  Future<Response> download(
    String path, {
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onDownloadProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get(path,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
          cancelToken: cancelToken,
          queryParameters: queryParameters,
          onReceiveProgress: onDownloadProgress);
    } on DioException catch (error) {
      throw ApiError.fromDioException(error);
    }
  }
}

final networkProvider = Provider<NetworkProvider>((ref) => NetworkProvider());
final noInterceptorNetworkProvider =
    Provider<NetworkProvider>((ref) => NetworkProvider.noInterceptor());
