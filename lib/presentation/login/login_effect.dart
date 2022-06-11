import 'package:bank_test/view_model.dart';

abstract class LoginEffect extends Effect {}

class ShowSnackbarConnectivityEffect extends LoginEffect {
  final String message;
  ShowSnackbarConnectivityEffect(this.message);
}

class ShowSnackbarSuccessEffect extends LoginEffect {
  final String message;
  ShowSnackbarSuccessEffect(this.message);
}

class ShowSnackbarErrorEffect extends LoginEffect {
  final String message;
  ShowSnackbarErrorEffect(this.message);
}

class ValidateFormLogin extends LoginEffect {
  ValidateFormLogin();
}

class ValidateFormRegister extends LoginEffect {
  ValidateFormRegister();
}
