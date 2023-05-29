import 'package:currency_formatter/currency_formatter.dart';

String currencyFormatter(
    {required int amount, required String currencySymbol, bool compacted = false, int decimal =2}) {
  CurrencyFormatterSettings euroSettings = CurrencyFormatterSettings(
    symbol: currencySymbol,
    symbolSide: SymbolSide.left,
    thousandSeparator: ',',
    decimalSeparator: '.',
    symbolSeparator: ' ',
  );

  String compact = CurrencyFormatter.format(amount, euroSettings,
   compact: compacted,
      decimal: decimal, enforceDecimals: true);

  return compact;
}
