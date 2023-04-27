// Author: Dean.Liu
// DateTime: 2023/04/27 18:34

import 'package:dio/dio.dart';

class AppApi {
  AppApi({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  }) : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: basePathOverride ?? basePath,
                connectTimeout: const Duration(seconds: 20),
                receiveTimeout: const Duration(seconds: 20),
              ),
            ) {
    this.dio.interceptors.addAll([
      LogInterceptor(),
      ...?interceptors,
    ]);
  }

  final Dio dio;

  static const String basePath = 'https://picsum.photos';
}
