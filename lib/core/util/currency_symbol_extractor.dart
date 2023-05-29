import 'package:ardilla/core/constants/general_constants.dart';

currencySymbolExtractor({required String symbol}) {
  if (symbol == CurrencyType.NGN.name) {
    return CurrencyType.NGN.symbol;
  } else if (symbol == CurrencyType.USD.name) {
    return CurrencyType.USD.symbol;
  } else {
    return CurrencyType.USD.symbol;
  }
}
