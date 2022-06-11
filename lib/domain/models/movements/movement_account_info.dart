import 'package:bank_test/domain/models/movements/movement.dart';
import 'package:bank_test/presentation/resources/enum_manager.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movement_account_info.g.dart';

@JsonSerializable()
class MovementAccountInfo {
  final String usuario;
  final String documento;
  final String tipoDocument;
  final String cuenta;
  final List<Movement> movimientos;

  MovementAccountInfo({
    required this.usuario,
    required this.documento,
    required this.tipoDocument,
    required this.cuenta,
    required this.movimientos,
  });

  factory MovementAccountInfo.fromJson(Map<String, dynamic> json) =>
      _$MovementAccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MovementAccountInfoToJson(this);

  DocumentType getDocumentType() {
    switch (tipoDocument) {
      case 'CC':
        return DocumentType.cc;
      case 'TI':
        return DocumentType.ti;
      case 'CE':
        return DocumentType.ce;
      case 'P':
        return DocumentType.p;
      default:
        return DocumentType.cc;
    }
  }
}
