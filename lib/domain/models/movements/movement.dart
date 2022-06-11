import 'package:bank_test/presentation/resources/enum_manager.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movement.g.dart';

@JsonSerializable()
class Movement {
  final String tipo;
  final String monto;
  final String fechaMovimiento;

  Movement({
    required this.tipo,
    required this.monto,
    required this.fechaMovimiento,
  });

  factory Movement.fromJson(Map<String, dynamic> json) =>
      _$MovementFromJson(json);

  Map<String, dynamic> toJson() => _$MovementToJson(this);

  double getAmount() {
    return double.parse(monto);
  }

  DateTime getCreatedDate() {
    return DateFormat("dd-MM-yyyy").parse(fechaMovimiento);
  }

  MovementType getMovementType() {
    switch (tipo) {
      case 'debito':
        return MovementType.debito;
      case 'credito':
        return MovementType.credito;
      case 'ingreso':
        return MovementType.ingreso;
      default:
        return MovementType.ninguno;
    }
  }
}
