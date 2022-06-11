import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/domain/models/movements/movement_account_info.dart';
import 'package:bank_test/view_model.dart';

class AccountDetailStatus extends ViewStatus {
  final bool isLoading;
  final Account account;
  final MovementAccountInfo movementAccountInfo;

  AccountDetailStatus({
    required this.isLoading,
    required this.account,
    required this.movementAccountInfo,
  });

  AccountDetailStatus copyWith({
    bool? isLoading,
    Account? account,
    MovementAccountInfo? movementAccountInfo,
  }) {
    return AccountDetailStatus(
      isLoading: isLoading ?? this.isLoading,
      account: account ?? this.account,
      movementAccountInfo: movementAccountInfo ?? this.movementAccountInfo,
    );
  }
}
