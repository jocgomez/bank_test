import 'package:bank_test/presentation/components/account_card.dart';
import 'package:bank_test/presentation/resources/assets_manager.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/icon_manager.dart';
import 'package:bank_test/presentation/resources/routes_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: const _HomeAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: const _HomeBody(),
          );
        },
      ),
    );
  }
}

class _HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppbar({Key? key}) : super(key: key);

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
              children: const <Widget>[
                Text(
                  AppStrings.welcome,
                  style: TextStyle(
                    fontSize: FontSizeManager.s14,
                  ),
                ),
                Text(
                  'Jose Gómez',
                  style: TextStyle(
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

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const _SearchSort(),
        const _AccountsList(),
      ],
    );
  }
}

class _SearchSort extends StatelessWidget {
  const _SearchSort({Key? key}) : super(key: key);

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
              onChanged: (String? value) {},
            ),
          ),
          Transform(
            alignment: Alignment.center,
            // TODO: Create rotation of sort icon and change tooltip
            transform: Matrix4.rotationX(0 /* math.pi */),
            child: IconButton(
              onPressed: () {},
              splashRadius: AppSize.s20,
              tooltip: AppStrings.sortAsc,
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
  const _AccountsList({Key? key}) : super(key: key);

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
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: AppSize.s16);
                },
                itemBuilder: (context, index) {
                  return const AccountCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
