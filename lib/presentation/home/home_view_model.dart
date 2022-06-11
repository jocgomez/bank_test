import 'package:bank_test/data/conectivity.dart';
import 'package:bank_test/data/services/service_iteractor.dart';
import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/domain/models/account_info.dart';
import 'package:bank_test/presentation/home/home_effect.dart';
import 'package:bank_test/presentation/home/home_status.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/view_model.dart';

class HomeViewModel extends EffectsViewModel<HomeStatus, HomeEffect> {
  final ServiceInteractor _interactor;

  HomeViewModel(this._interactor) {
    status = HomeStatus(
      isLoading: false,
      accountInfo: AccountInfo(
        Cuentas: [],
        documento: '',
        tipoDocument: '',
        usuario: '',
      ),
      savedAccounts: [],
      ascending: false,
      descending: false,
    );
  }

  Future<void> onInit() async {
    bool next = await Connection.validateConnection();
    if (next) {
      await getAccountInfo();
    } else {
      addEffect(ShowSnackbarConnectivityEffect(AppStrings.noConnectivity));
    }
  }

  Future<void> getAccountInfo() async {
    try {
      await _interactor.getAccountInfo().then((value) {
        status = status.copyWith(
          accountInfo: value,
          savedAccounts: value.Cuentas,
        );
      });
    } catch (e) {
      addEffect(ShowSnackbarErrorEffect(AppStrings.errorQuery));
      print('Error $e');
    }
  }

  void sortAccountsByDate() {
    final List<Account> sortedList = status.accountInfo.Cuentas;

    if ((!status.ascending && !status.descending) || status.ascending) {
      sortedList.sort((a, b) {
        return a.getCreatedDate().compareTo(b.getCreatedDate());
      });
      status = status.copyWith(
        ascending: false,
        descending: true,
      );
    } else {
      sortedList.sort((a, b) {
        return b.getCreatedDate().compareTo(a.getCreatedDate());
      });
      status = status.copyWith(
        ascending: true,
        descending: false,
      );
    }

    status = status.copyWith(
      accountInfo: AccountInfo(
        usuario: status.accountInfo.usuario,
        documento: status.accountInfo.documento,
        tipoDocument: status.accountInfo.tipoDocument,
        Cuentas: sortedList,
      ),
    );
  }

  void searchAccounts(String? value) {
    if (value != null && value.isNotEmpty) {
      final List<Account> filteredList =
          status.accountInfo.Cuentas.where((account) {
        return account.numero.contains(value);
      }).toList();

      status = status.copyWith(
        accountInfo: AccountInfo(
          usuario: status.accountInfo.usuario,
          documento: status.accountInfo.documento,
          tipoDocument: status.accountInfo.tipoDocument,
          Cuentas: filteredList,
        ),
      );
    } else {
      status = status.copyWith(
        accountInfo: AccountInfo(
          usuario: status.accountInfo.usuario,
          documento: status.accountInfo.documento,
          tipoDocument: status.accountInfo.tipoDocument,
          Cuentas: status.savedAccounts,
        ),
      );
    }
  }
}
