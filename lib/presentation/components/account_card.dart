import 'package:bank_test/domain/models/account.dart';
import 'package:bank_test/presentation/resources/color_manager.dart';
import 'package:bank_test/presentation/resources/font_manager.dart';
import 'package:bank_test/presentation/resources/routes_manager.dart';
import 'package:bank_test/presentation/resources/string_manager.dart';
import 'package:bank_test/presentation/resources/values_manager.dart';
import 'package:bank_test/utils/format_amount.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({Key? key, required this.account, this.onTap = true})
      : super(key: key);
  final Account account;
  final bool onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: AppSize.s4,
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
      child: InkWell(
        onTap: onTap
            ? () {
                Navigator.pushNamed(
                  context,
                  Routes.accountDetailRoute,
                  arguments: account,
                );
              }
            : null,
        child: Row(
          children: <Widget>[
            Container(
              height: 78,
              width: AppSize.s16,
              color: ColorManager.secondaryOpacity70,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Text(
                              '${AppStrings.account} #',
                              style: TextStyle(
                                fontSize: FontSizeManager.s12,
                                color: ColorManager.grey,
                              ),
                            ),
                            Text(
                              account.numero,
                              style: TextStyle(
                                fontSize: FontSizeManager.s12,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(account.fechaApertura,
                            style: TextStyle(
                                fontSize: FontSizeManager.s12,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.lightGrey)),
                      ],
                    ),
                    const SizedBox(height: AppSize.s8),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '\$ ${FormatAmount.format(account.getAmount())} ${AppStrings.cop}',
                        style: TextStyle(
                          fontSize: FontSizeManager.s20,
                          fontWeight: FontWeightManager.bold,
                          color: ColorManager.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
