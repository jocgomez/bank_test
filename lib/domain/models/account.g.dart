// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountNumber: json['accountNumber'] as String,
      amount: json['amount'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'amount': instance.amount,
      'createdDate': instance.createdDate,
    };
