import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/domain/models/movements/movement.dart';
import 'package:bank_test/presentation/components/account_card.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/enum_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:bank_test/utils/format_amount.dart';
import 'package:flutter/material.dart';

class AccountDetailView extends StatefulWidget {
  const AccountDetailView({Key? key}) : super(key: key);

  @override
  State<AccountDetailView> createState() => _AccountDetailViewState();
}

class _AccountDetailViewState extends State<AccountDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: const _AccountDetailAppbar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: const _AccountDetailBody(),
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

class _AccountDetailBody extends StatelessWidget {
  const _AccountDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: AppSize.s20),
        AccountCard(
          account: Account(
            numero: '111111111',
            saldo: '30000000',
            fechaApertura: '10/01/2022',
          ),
          onTap: false,
        ),
        const SizedBox(height: AppSize.s30),
        const _ListAccountMovements(),
      ],
    );
  }
}

class _ListAccountMovements extends StatelessWidget {
  const _ListAccountMovements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return _AccountMovement(
              movement: Movement(
                tipo: 'ingreso',
                monto: '100000',
                fechaMovimiento: '10/10/2020',
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
