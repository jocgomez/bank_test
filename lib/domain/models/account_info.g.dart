// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) => AccountInfo(
      usuario: json['usuario'] as String,
      documento: json['documento'] as String,
      tipoDocument: json['tipoDocument'] as String,
      Cuentas: (json['Cuentas'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'documento': instance.documento,
      'tipoDocument': instance.tipoDocument,
      'Cuentas': instance.Cuentas,
    };
