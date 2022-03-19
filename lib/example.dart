import 'package:boleto/boleto.dart';

void main() {
  final boleto = Boleto();

  String line = "03399.81334 06900.003325 56179.801016 3 89300000010990";

  final double amount = boleto.getAmount(line); // returns 109.90

  final DateTime expireDate =
      boleto.getExpireDate(line); // returns DateTime(2022, 03, 20)

  final String bankCode = boleto.getBankCode(line); // returns 033 (Santander)
}
