abstract class BoletoException implements Exception {}

class InvalidFormatBoletoException extends BoletoException {
  @override
  String toString() {
    return "Given line should contain 47 or 48 characters";
  }
}
