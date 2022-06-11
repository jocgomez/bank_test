import 'dart:async';

import 'package:bank_test/data/get_it_locator.dart';
import 'package:bank_test/data/services/local_storage_service.dart';
import 'package:bank_test/presentation/extension/snackbar_build.dart';
import 'package:bank_test/presentation/login/login_effect.dart';
import 'package:bank_test/presentation/login/login_view_model.dart';
import 'package:bank_test/presentation/resources/assets_manager.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/icon_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(
        locator<LocalStorageService>(),
      ),
      builder: (BuildContext context, _) {
        return const _LoginBody();
      },
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  State<_LoginBody> createState() => __LoginBodyState();
}

class __LoginBodyState extends State<_LoginBody> {
  late StreamSubscription<LoginEffect> _effectSubscription;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController repeatPassCtrl = TextEditingController();

  @override
  void initState() {
    LoginViewModel viewModel = context.read<LoginViewModel>();
    _effectSubscription = viewModel.effects.listen((LoginEffect event) async {
      if (event is ShowSnackbarConnectivityEffect) {
        SnackbarBuild.buildConnectivitySnackbar(context, event.message);
      } else if (event is ShowSnackbarErrorEffect) {
        SnackbarBuild.buildSnackbar(context, event.message);
      } else if (event is ShowSnackbarSuccessEffect) {
        SnackbarBuild.buildSuccessSnackbar(context, event.message);
      } else if (event is ValidateFormLogin) {
        if (keyForm.currentState!.validate()) {
          viewModel.login(context);
        }
      } else if (event is ValidateFormRegister) {
        if (keyForm.currentState!.validate()) {
          viewModel.register(context);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _effectSubscription.cancel();
    userCtrl.dispose();
    passwordCtrl.dispose();
    repeatPassCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = context.watch<LoginViewModel>();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(AppSize.s20),
              child: Image(image: AssetImage(AssetsManager.loginLogo)),
            ),
            Text(
              viewModel.status.isRegister
                  ? AppStrings.registerTitle
                  : AppStrings.loginTitle,
              style: TextStyle(
                  fontSize: FontSizeManager.s20,
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.primary),
            ),
            _FormField(
              keyForm: keyForm,
              userCtrl: userCtrl,
              passCtrl: passwordCtrl,
              repeatPassCtrl: repeatPassCtrl,
              viewModel: viewModel,
            ),
            _NoAccountText(
              viewModel: viewModel,
            ),
            const SizedBox(height: AppSize.s20)
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    Key? key,
    required this.keyForm,
    required this.userCtrl,
    required this.passCtrl,
    required this.repeatPassCtrl,
    required this.viewModel,
  }) : super(key: key);
  final GlobalKey<FormState> keyForm;
  final TextEditingController userCtrl;
  final TextEditingController passCtrl;
  final TextEditingController repeatPassCtrl;
  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      margin: const EdgeInsets.all(AppMargin.m20),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s8),
          topRight: Radius.circular(AppSize.s8),
          bottomLeft: Radius.circular(AppSize.s8),
          bottomRight: Radius.circular(AppSize.s8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: AppSize.s4,
            blurRadius: AppSize.s8,
            offset: const Offset(0, AppSize.s4), // changes position of shadow
          ),
        ],
      ),
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              validator: viewModel.validateEmptyForm,
              decoration: InputDecoration(
                suffixIcon: const Icon(IconManager.username),
                labelText: AppStrings.userName,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryOpacity70,
                  ),
                ),
              ),
              onChanged: viewModel.updateUsername,
            ),
            const SizedBox(height: AppSize.s14),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: viewModel.status.hidePass,
              validator: viewModel.validateEmptyForm,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: viewModel.hidePassword,
                  icon: Icon(
                    viewModel.status.hidePass
                        ? IconManager.passwordClosed
                        : IconManager.passwordOpen,
                  ),
                ),
                labelText: AppStrings.password,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryOpacity70,
                  ),
                ),
              ),
              onChanged: viewModel.updatePassword,
            ),
            if (viewModel.status.isRegister) ...[
              const SizedBox(height: AppSize.s14),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: viewModel.status.hidePass,
                validator: viewModel.validateEmptyForm,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: viewModel.hidePassword,
                    icon: Icon(
                      viewModel.status.hidePass
                          ? IconManager.passwordClosed
                          : IconManager.passwordOpen,
                    ),
                  ),
                  labelText: AppStrings.repeatPassword,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.primaryOpacity70,
                    ),
                  ),
                ),
                onChanged: viewModel.updateRepeatPassword,
              ),
            ],
            const SizedBox(height: AppSize.s20),
            ElevatedButton(
              onPressed:
                  viewModel.status.isLoading ? null : viewModel.validateForm,
              child: Text(
                viewModel.status.isRegister
                    ? AppStrings.register
                    : AppStrings.login,
                style: const TextStyle(fontSize: AppSize.s14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NoAccountText extends StatelessWidget {
  const _NoAccountText({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          viewModel.status.isRegister
              ? AppStrings.withAccount
              : AppStrings.noAccount,
          style: TextStyle(
            fontSize: FontSizeManager.s12,
            color: ColorManager.darkGrey,
          ),
        ),
        TextButton(
          onPressed: viewModel.changeRegister,
          child: Text(
            viewModel.status.isRegister
                ? AppStrings.login
                : AppStrings.register,
            style: TextStyle(color: ColorManager.primary),
          ),
        ),
      ],
    );
  }
}
