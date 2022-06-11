import 'package:bank_test/data/conectivity.dart';
import 'package:bank_test/data/services/service_iteractor.dart';
import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/domain/models/movements/movement_account_info.dart';
import 'package:bank_test/presentation/account_detail/account_detail_effect.dart';
import 'package:bank_test/presentation/account_detail/account_detail_status.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/view_model.dart';

class AccountDetailViewModel
    extends EffectsViewModel<AccountDetailStatus, AccountDetailEffect> {
  final ServiceInteractor _interactor;
  final Account account;

  AccountDetailViewModel(this._interactor, this.account) {
    status = AccountDetailStatus(
      isLoading: true,
      account: account,
      movementAccountInfo: MovementAccountInfo(
        usuario: '',
        documento: '',
        tipoDocument: '',
        cuenta: '',
        movimientos: [],
      ),
    );
  }

  Future<void> onInit() async {
    bool next = await Connection.validateConnection();
    if (next) {
      await getDetailAccountInfo();
    } else {
      addEffect(ShowSnackbarConnectivityEffect(AppStrings.noConnectivity));
    }
  }

  Future<void> getDetailAccountInfo() async {
    try {
      await _interactor.getMovementInfo().then((value) {
        status = status.copyWith(movementAccountInfo: value);
      });
    } catch (e) {
      addEffect(ShowSnackbarErrorEffect(AppStrings.errorQuery));
      print('Error $e');
    }
  }
}
