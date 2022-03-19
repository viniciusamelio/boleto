import 'package:boleto/boleto.dart';

abstract class BoletoException {}

class InvalidFormatBoletoException extends Boleto {
  @override
  String toString() {
    return "Given line should contain 47 characters";
  }
}
