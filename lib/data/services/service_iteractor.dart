import 'dart:io';

import 'package:bank_test/data/get_it_locator.dart';
import 'package:bank_test/domain/models/account_info.dart';
import 'package:bank_test/data/services/gateway_service.dart';
import 'package:bank_test/domain/models/movements/movement_account_info.dart';

class ServiceInteractor {
  Future<AccountInfo> getAccountInfo() async {
    final AccountInfo response =
        await locator<GatewayService>().getAccountInformation();

    return response;
  }

  Future<MovementAccountInfo> getMovementInfo() async {
    final MovementAccountInfo response =
        await locator<GatewayService>().getMovementAccountInformation();

    return response;
  }
}
