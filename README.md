## Features

- Barcode conversion to digitable line;
- Billet info extraction from line;

## Getting started

All you need to do is add this to your project
```dart
flutter pub add boleto
```


## Usage

```dart
import "packages:boleto/boleto.dart";
const validator = Boleto();

// Getting line from a barcode
final String? line = validator.getLineFromBarcode(barcode);

// Getting billet amount
final double amount = validator.getAmount(line!);

// Getting expire date
final Datetime expireDate = validator.getExpireDate(line!);

final String bankCode = validator.getBankCode(line!);

```