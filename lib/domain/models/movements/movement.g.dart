// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movement _$MovementFromJson(Map<String, dynamic> json) => Movement(
      tipo: json['tipo'] as String,
      monto: json['monto'] as String,
      fechaMovimiento: json['fechaMovimiento'] as String,
    );

Map<String, dynamic> _$MovementToJson(Movement instance) => <String, dynamic>{
      'tipo': instance.tipo,
      'monto': instance.monto,
      'fechaMovimiento': instance.fechaMovimiento,
    };
