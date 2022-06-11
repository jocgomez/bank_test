import 'dart:async';

import 'package:bank_test/data/get_it_locator.dart';
import 'package:bank_test/data/services/service_iteractor.dart';
import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/presentation/components/account_card.dart';
import 'package:bank_test/presentation/extension/snackbar_build.dart';
import 'package:bank_test/presentation/home/home_effect.dart';
import 'package:bank_test/presentation/home/home_view_model.dart';
import 'package:bank_test/presentation/resources/assets_manager.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/icon_manager.dart';
import 'package:bank_test/presentation/resources/routes_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(
        locator<ServiceInteractor>(),
      ),
      builder: (BuildContext context, _) {
        return const _HomeBody();
      },
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  State<_HomeBody> createState() => __HomeBodyState();
}

class __HomeBodyState extends State<_HomeBody> {
  late StreamSubscription<HomeEffect> _effectSubscription;

  @override
  void initState() {
    HomeViewModel viewModel = context.read<HomeViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.onInit();
    });

    _effectSubscription = viewModel.effects.listen((HomeEffect event) async {
      if (event is ShowSnackbarConnectivityEffect) {
        SnackbarBuild.buildConnectivitySnackbar(context, event.message);
      } else if (event is ShowSnackbarErrorEffect) {
        SnackbarBuild.buildSnackbar(context, event.message);
      } else if (event is ShowSnackbarSuccessEffect) {
        SnackbarBuild.buildSuccessSnackbar(context, event.message);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _effectSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: _HomeAppbar(viewModel: viewModel),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: _HomeContent(viewModel: viewModel),
          );
        },
      ),
    );
  }
}

class _HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppbar({Key? key, required this.viewModel}) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.infinite,
      child: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(IconManager.logOut),
            tooltip: AppStrings.logOut,
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
          ),
        ],
        backgroundColor: ColorManager.primary,
        title: Row(
          children: [
            const Image(
              image: AssetImage(AssetsManager.bankLogo),
              fit: BoxFit.scaleDown,
              height: 60,
            ),
            const SizedBox(width: AppSize.s12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  AppStrings.welcome,
                  style: TextStyle(
                    fontSize: FontSizeManager.s14,
                  ),
                ),
                Text(
                  viewModel.status.accountInfo.usuario.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({Key? key, required this.viewModel}) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _SearchSort(viewModel: viewModel),
        _AccountsList(viewModel: viewModel),
      ],
    );
  }
}

class _SearchSort extends StatelessWidget {
  const _SearchSort({Key? key, required this.viewModel}) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: const Icon(IconManager.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryOpacity70,
                  ),
                ),
              ),
              // TODO: Search account in real time
              onChanged: viewModel.searchAccounts,
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(
              viewModel.status.ascending
                  ? 0
                  : viewModel.status.descending
                      ? math.pi
                      : 0,
            ),
            child: IconButton(
              onPressed: viewModel.sortAccountsByDate,
              splashRadius: AppSize.s20,
              tooltip: viewModel.status.ascending
                  ? AppStrings.sortAsc
                  : AppStrings.sortDesc,
              icon: Icon(
                IconManager.sort,
                color: ColorManager.primary,
                size: AppSize.s30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountsList extends StatelessWidget {
  const _AccountsList({Key? key, required this.viewModel}) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: AppPadding.p12),
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
            child: const Text(
              AppStrings.bankAccounts,
              style: TextStyle(
                fontSize: FontSizeManager.s16,
                fontWeight: FontWeightManager.semiBold,
              ),
            ),
          ),
          Flexible(
            child: RefreshIndicator(
              color: ColorManager.primary,
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.separated(
                itemCount: viewModel.status.accountInfo.Cuentas.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: AppSize.s16);
                },
                itemBuilder: (context, index) {
                  final Account account =
                      viewModel.status.accountInfo.Cuentas[index];
                  return AccountCard(
                    account: Account(
                      numero: account.numero,
                      saldo: account.saldo,
                      fechaApertura: account.fechaApertura,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
