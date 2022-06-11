import 'dart:async';

import 'package:bank_test/data/get_it_locator.dart';
import 'package:bank_test/data/services/service_iteractor.dart';
import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/domain/models/movements/movement.dart';
import 'package:bank_test/presentation/account_detail/account_detail_effect.dart';
import 'package:bank_test/presentation/account_detail/account_detail_view_model.dart';
import 'package:bank_test/presentation/components/account_card.dart';
import 'package:bank_test/presentation/extension/snackbar_build.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/enum_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:bank_test/utils/format_amount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailView extends StatelessWidget {
  const AccountDetailView({Key? key, required this.account}) : super(key: key);
  final Account account;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountDetailViewModel>(
      create: (_) => AccountDetailViewModel(
        locator<ServiceInteractor>(),
        account,
      ),
      builder: (BuildContext context, _) {
        return const _AccountDetailBody();
      },
    );
  }
}

class _AccountDetailBody extends StatefulWidget {
  const _AccountDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_AccountDetailBody> createState() => __AccountDetailBodyState();
}

class __AccountDetailBodyState extends State<_AccountDetailBody> {
  late StreamSubscription<AccountDetailEffect> _effectSubscription;

  @override
  void initState() {
    AccountDetailViewModel viewModel = context.read<AccountDetailViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.onInit();
    });

    _effectSubscription =
        viewModel.effects.listen((AccountDetailEffect event) async {
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
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: const _AccountDetailAppbar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: const _AccountDetailContent(),
        );
      }),
    );
  }
}

class _AccountDetailAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const _AccountDetailAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.infinite,
      child: AppBar(
        backgroundColor: ColorManager.primary,
        title: const Text(
          AppStrings.detailAccount,
          style: TextStyle(
            fontWeight: FontWeightManager.bold,
          ),
        ),
      ),
    );
  }
}

class _AccountDetailContent extends StatelessWidget {
  const _AccountDetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountDetailViewModel viewModel = context.watch<AccountDetailViewModel>();

    return Column(
      children: <Widget>[
        const SizedBox(height: AppSize.s20),
        AccountCard(
          account: Account(
            numero: viewModel.account.numero,
            saldo: viewModel.account.saldo,
            fechaApertura: viewModel.account.fechaApertura,
          ),
          onTap: false,
        ),
        const SizedBox(height: AppSize.s30),
        _ListAccountMovements(viewModel: viewModel),
      ],
    );
  }
}

class _ListAccountMovements extends StatelessWidget {
  const _ListAccountMovements({Key? key, required this.viewModel})
      : super(key: key);
  final AccountDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
          itemCount: viewModel.status.movementAccountInfo.movimientos.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            Movement movement =
                viewModel.status.movementAccountInfo.movimientos[index];
            return _AccountMovement(
              movement: Movement(
                tipo: movement.tipo,
                monto: movement.monto,
                fechaMovimiento: movement.fechaMovimiento,
              ),
            );
          }),
    );
  }
}

class _AccountMovement extends StatelessWidget {
  const _AccountMovement({Key? key, required this.movement}) : super(key: key);
  final Movement movement;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            movement.fechaMovimiento,
            style: const TextStyle(
              fontSize: FontSizeManager.s12,
              fontWeight: FontWeightManager.regular,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                movement.tipo.toUpperCase(),
                style: TextStyle(
                  fontSize: FontSizeManager.s14,
                  fontWeight: FontWeightManager.medium,
                  color: ColorManager.secondary,
                ),
              ),
              const SizedBox(width: AppSize.s16),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '\$ ${FormatAmount.format(movement.getAmount())} ${AppStrings.cop}',
                  style: TextStyle(
                    fontSize: FontSizeManager.s20,
                    fontWeight: FontWeightManager.bold,
                    color: getTypeColor(
                      movement.getMovementType(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Color getTypeColor(MovementType type) {
  switch (type) {
    case MovementType.debito:
      return ColorManager.error;
    case MovementType.credito:
      return ColorManager.error;
    case MovementType.ingreso:
      return ColorManager.success;
    default:
      return ColorManager.grey;
  }
}
