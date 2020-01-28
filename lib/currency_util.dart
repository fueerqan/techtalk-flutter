import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class CurrencyUtil {
  static String formatToIDR(double price) {
    return FlutterMoneyFormatter(
        amount: price,
        settings: MoneyFormatterSettings(
          symbol: "Rp",
          thousandSeparator: ".",
          symbolAndNumberSeparator: "",
          fractionDigits: 0,
          compactFormatType: CompactFormatType.short,
        )).output.symbolOnLeft;
  }
}
