import 'package:bank_test/data/conectivity.dart';
import 'package:bank_test/data/services/local_storage_service.dart';
import 'package:bank_test/presentation/login/login_effect.dart';
import 'package:bank_test/presentation/login/login_status.dart';
import 'package:bank_test/presentation/resources/routes_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/view_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends EffectsViewModel<LoginStatus, LoginEffect> {
  final LocalStorageService _localStorage;

  LoginViewModel(this._localStorage) {
    status = LoginStatus(
      isLoading: false,
      isRegister: false,
      hidePass: true,
      userName: '',
      password: '',
      repeatPassword: '',
    );
  }

  void updateUsername(String? userName) {
    status = status.copyWith(userName: userName);
  }

  void updatePassword(String? password) {
    status = status.copyWith(password: password);
  }

  void updateRepeatPassword(String? password) {
    status = status.copyWith(repeatPassword: password);
  }

  String? validateEmptyForm(String? value) {
    if (value == null || value.isEmpty) {
      return 'El campo es obligatorio';
    }
    return null;
  }

  void hidePassword() {
    status = status.copyWith(hidePass: !status.hidePass);
  }

  void changeRegister() {
    status = status.copyWith(isRegister: !status.isRegister);
  }

  void validateForm() async {
    bool next = await Connection.validateConnection();
    if (next) {
      addEffect(
          status.isRegister ? ValidateFormRegister() : ValidateFormLogin());
    } else {
      addEffect(ShowSnackbarConnectivityEffect(AppStrings.noConnectivity));
    }
  }

  void register(BuildContext context) async {
    status = status.copyWith(isLoading: true);
    if (status.password == status.repeatPassword) {
      _localStorage
          .getPreferences()
          ?.setString(status.userName, status.password);
      addEffect(ShowSnackbarSuccessEffect(AppStrings.succesRegister));
      status = status.copyWith(isRegister: false);
    } else {
      addEffect(ShowSnackbarErrorEffect(AppStrings.errorRegister));
    }

    status = status.copyWith(isLoading: false);
  }

  void login(BuildContext context) async {
    status = status.copyWith(isLoading: true);
    String? password =
        _localStorage.getPreferences()?.getString(status.userName) ?? '';
    if (password.isNotEmpty && password == status.password) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      addEffect(ShowSnackbarErrorEffect(AppStrings.errorCredentials));
    }
    status = status.copyWith(isLoading: false);
  }
}
