import 'package:bank_test/view_model.dart';

abstract class AccountDetailEffect extends Effect {}

class ShowSnackbarConnectivityEffect extends AccountDetailEffect {
  final String message;
  ShowSnackbarConnectivityEffect(this.message);
}

class ShowSnackbarSuccessEffect extends AccountDetailEffect {
  final String message;
  ShowSnackbarSuccessEffect(this.message);
}

class ShowSnackbarErrorEffect extends AccountDetailEffect {
  final String message;
  ShowSnackbarErrorEffect(this.message);
}
