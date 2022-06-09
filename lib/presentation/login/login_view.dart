import 'package:bank_test/presentation/resources/assets_manager.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/icon_manager.dart';
import 'package:bank_test/presentation/resources/routes_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
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
              'Inicio de sesión',
              style: TextStyle(
                  fontSize: FontSizeManager.s20,
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.primary),
            ),
            const _FormField(),
            const _NoAccountText(),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                suffixIcon: const Icon(IconManager.username),
                labelText: AppStrings.userName,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryOpacity70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s14),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(IconManager.passwordClosed),
                labelText: AppStrings.password,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryOpacity70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.homeRoute);
              },
              child: const Text(AppStrings.login,
                  style: TextStyle(fontSize: AppSize.s14)),
            )
          ],
        ),
      ),
    );
  }
}

class _NoAccountText extends StatelessWidget {
  const _NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.noAccount,
          style: TextStyle(
            fontSize: FontSizeManager.s12,
            color: ColorManager.darkGrey,
          ),
        ),
        TextButton(
          child: Text(
            AppStrings.register,
            style: TextStyle(color: ColorManager.primary),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
