import 'package:bank_test/view_model.dart';

class LoginStatus extends ViewStatus {
  final bool isLoading;
  final bool isRegister;
  final bool hidePass;
  final String userName;
  final String password;
  final String repeatPassword;

  LoginStatus({
    required this.isLoading,
    required this.isRegister,
    required this.hidePass,
    required this.userName,
    required this.password,
    required this.repeatPassword,
  });

  LoginStatus copyWith({
    bool? isLoading,
    bool? isRegister,
    bool? hidePass,
    String? userName,
    String? password,
    String? repeatPassword,
  }) {
    return LoginStatus(
      isLoading: isLoading ?? this.isLoading,
      isRegister: isRegister ?? this.isRegister,
      hidePass: hidePass ?? this.hidePass,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      repeatPassword: repeatPassword ?? this.repeatPassword,
    );
  }
}
