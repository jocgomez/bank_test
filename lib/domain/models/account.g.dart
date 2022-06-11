// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      numero: json['numero'] as String,
      saldo: json['saldo'] as String,
      fechaApertura: json['fechaApertura'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'numero': instance.numero,
      'saldo': instance.saldo,
      'fechaApertura': instance.fechaApertura,
    };
