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

  @override
  Future<AccountInfo> getAccountInformation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AccountInfo>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/79bd5861-8cbf-46b6-bb6c-88b13457c40f',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AccountInfo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovementAccountInfo> getMovementAccountInformation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovementAccountInfo>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/79bd5861-8cbf-46b6-bb6c-88b13457c40f',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovementAccountInfo.fromJson(_result.data!);
    return value;
  }

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
