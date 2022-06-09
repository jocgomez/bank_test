import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/routes_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Wait 2 seconds before navigate to the next screen (Simulate loading some data)
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
