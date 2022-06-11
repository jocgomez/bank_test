import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String numero;
  final String saldo;
  final String fechaApertura;

  Account({
    required this.numero,
    required this.saldo,
    required this.fechaApertura,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  double getAmount() {
    return double.parse(saldo);
  }

  DateTime getCreatedDate() {
    return DateFormat("dd/MM/yyyy").parse(fechaApertura);
  }
}
