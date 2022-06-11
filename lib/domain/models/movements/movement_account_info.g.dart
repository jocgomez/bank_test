// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementAccountInfo _$MovementAccountInfoFromJson(Map<String, dynamic> json) =>
    MovementAccountInfo(
      usuario: json['usuario'] as String,
      documento: json['documento'] as String,
      tipoDocument: json['tipoDocument'] as String,
      cuenta: json['cuenta'] as String,
      movimientos: (json['movimientos'] as List<dynamic>)
          .map((e) => Movement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovementAccountInfoToJson(
        MovementAccountInfo instance) =>
    <String, dynamic>{
      'usuario': instance.usuario,
      'documento': instance.documento,
      'tipoDocument': instance.tipoDocument,
      'cuenta': instance.cuenta,
      'movimientos': instance.movimientos,
    };
