import 'package:bank_test/view_model.dart';

abstract class HomeEffect extends Effect {}

class ShowSnackbarConnectivityEffect extends HomeEffect {
  final String message;
  ShowSnackbarConnectivityEffect(this.message);
}

class ShowSnackbarSuccessEffect extends HomeEffect {
  final String message;
  ShowSnackbarSuccessEffect(this.message);
}

class ShowSnackbarErrorEffect extends HomeEffect {
  final String message;
  ShowSnackbarErrorEffect(this.message);
}
