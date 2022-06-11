import 'package:bank_test/domain/models/account_info.dart';
import 'package:bank_test/domain/models/movements/movement_account_info.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'gateway_service.g.dart';

class UrlsApi {
  static const String getAccountInformation =
      '/79bd5861-8cbf-46b6-bb6c-88b13457c40f';
  static const String getMovementAccount =
      '/8997dfa4-bcd8-48cf-abcf-73288aa40b3c';
}

@RestApi(baseUrl: 'https://run.mocky.io/v3')
abstract class GatewayService {
  factory GatewayService(Dio dio, {String baseUrl}) = _GatewayService;

  //Account information
  @POST(UrlsApi.getAccountInformation)
  Future<AccountInfo> getAccountInformation();

  //Account movements
  @POST(UrlsApi.getMovementAccount)
  Future<MovementAccountInfo> getMovementAccountInformation();
}
