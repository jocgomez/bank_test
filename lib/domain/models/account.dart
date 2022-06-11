import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String accountNumber;
  final String amount;
  final String createdDate;

  Account({
    required this.accountNumber,
    required this.amount,
    required this.createdDate,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  double getAmount() {
    return double.parse(amount);
  }

  DateTime getCreatedDate() {
    return DateFormat("dd-MM-yyyy").parse(createdDate);
  }
}
