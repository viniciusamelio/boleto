import 'package:boleto/boleto.dart';

abstract class BoletoException implements Exception {}

class InvalidFormatBoletoException extends Boleto {
  @override
  String toString() {
    return "Given line should contain 47 or 48 characters";
  }
}
