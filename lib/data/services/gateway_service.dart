import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'gateway_service.g.dart';

class UrlsApi {
  static const String getAccountInformation =
      '/2677cff9-3395-48d4-8e1a-ea6d660406c7';
  static const String getMovementAccount =
      '/ed3641e0-b97e-4c81-a404-24cbdc36430e';
}

@RestApi(baseUrl: 'https://run.mocky.io/v3')
abstract class GatewayService {
  factory GatewayService(Dio dio, {String baseUrl}) = _GatewayService;

  //Login & Register
  /* @POST(UrlsApi.getAccountInformation)
  Future<ResponseData<ResultLogin>> getAccountInformation(
    @Body() BodyLogin bodyLogin,
  ); */
}
