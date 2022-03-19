library boleto;

class Boleto {
  double getAmount(String line) {
    String cleanedLine = line.replaceAll(RegExp("[^0-9]"), "");
    final size = cleanedLine.length - 1;
    return (double.parse(
          cleanedLine.substring(size - 9, size),
        ) /
        10);
  }

  DateTime getExpireDate(String line) {
    String cleanedLine = line.replaceAll(RegExp("[^0-9]"), "");
    final size = cleanedLine.length - 1;
    final countDays = int.parse(cleanedLine.substring(size - 13, size - 9));
    return DateTime(1997, 10, 07).add(
      Duration(days: countDays),
    );
  }

  String getBankCode(String line) {
    String cleanedLine = line.replaceAll(RegExp("[^0-9]"), "");
    return cleanedLine.substring(0, 3);
  }

  String? getLineFromCodebar(String barcode) {
    String linha = barcode.replaceAll(RegExp("[^0-9]"), "");

    if (linha.length != 44) {
      return null;
    }

    String campo1 = linha.substring(0, 4) +
        linha.substring(19, 20) +
        '.' +
        linha.substring(20, 24);
    String campo2 = linha.substring(24, 29) + '.' + linha.substring(29, 34);
    String campo3 = linha.substring(34, 39) + '.' + linha.substring(39, 44);
    String campo4 = linha.substring(4, 5); // Digito verificador
    String campo5 = linha.substring(5, 19); // Vencimento + Valor

    if (_modulo11Banco(linha.substring(0, 4) + linha.substring(5, 44)) !=
        int.parse(campo4)) {
      return null; //'Digito verificador '+campo4+', o correto é '+modulo11_banco(  linha.substr(0,4)+linha.substr(5,99)  )+'\nO sistema não altera automaticamente o dígito correto na quinta casa!'
    }
    return campo1 +
        _modulo10(campo1).toString() +
        ' ' +
        campo2 +
        _modulo10(campo2).toString() +
        ' ' +
        campo3 +
        _modulo10(campo3).toString() +
        ' ' +
        campo4 +
        ' ' +
        campo5;
  }

  int _modulo10(String numero) {
    numero = numero.replaceAll("[^0-9]", "");
    int soma = 0;
    int peso = 2;
    int contador = numero.length - 1;
    while (contador >= 0) {
      int multiplicacao =
          int.parse(numero.substring(contador, contador + 1)) * peso;
      if (multiplicacao >= 10) {
        multiplicacao = 1 + (multiplicacao - 10);
      }
      soma = soma + multiplicacao;
      if (peso == 2) {
        peso = 1;
      } else {
        peso = 2;
      }
      contador = contador - 1;
    }
    int digito = 10 - (soma % 10);
    if (digito == 10) digito = 0;

    return digito;
  }

  int _modulo11Banco(String numero) {
    numero = numero.replaceAll("[^0-9]", "");

    int soma = 0;
    int peso = 2;
    int base = 9;
    int contador = numero.length - 1;
    for (int i = contador; i >= 0; i--) {
      soma = soma + (int.parse(numero.substring(i, i + 1)) * peso);
      if (peso < base) {
        peso++;
      } else {
        peso = 2;
      }
    }
    int digito = 11 - (soma % 11);
    if (digito > 9) digito = 0;
    /* Utilizar o dígito 1(um) sempre que o resultado do cálculo padrão for igual a 0(zero), 1(um) ou 10(dez). */
    if (digito == 0) digito = 1;
    return digito;
  }
}
