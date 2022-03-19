import 'package:flutter_test/flutter_test.dart';

import 'package:boleto/boleto.dart';

void main() {
  final sut = Boleto();

  test('Should give expected amount', () {
    final valor =
        sut.getAmount("03399.81334 06900.003317 40036.701015 1 89020000010990");
    expect(
      valor,
      equals(109.90),
    );
    final valor1 = sut.getAmount("89020000009096");
    expect(
      valor1,
      equals(90.96),
    );
  });

  test("Should give expected expire date", () {
    final expireDate = sut.getExpireDate(
      "03399.81334 06900.003325 56179.801016 3 89300000010990",
    );

    expect(
      expireDate,
      equals(
        DateTime(2022, 03, 20),
      ),
    );
  });

  test("Should return expected bank code", () {
    final bankCode = sut.getBankCode(
      "03399.81334 06900.003325 56179.801016 3 89300000010990",
    );
    expect(
      bankCode,
      equals("033"),
    );
  });

  test("Should throw ", () {});
}
