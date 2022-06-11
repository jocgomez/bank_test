import 'package:bank_test/presentation/resources/enum_manager.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bank_test/domain/models/account.dart';

part 'account_info.g.dart';

@JsonSerializable()
class AccountInfo {
  final String usuario;
  final String documento;
  final String tipoDocument;
  final List<Account> Cuentas;

  AccountInfo({
    required this.usuario,
    required this.documento,
    required this.tipoDocument,
    required this.Cuentas,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);

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
