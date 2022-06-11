// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GatewayService implements GatewayService {
  _GatewayService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://run.mocky.io/v3';
  }

  final Dio _dio;

  String? baseUrl;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
