/// Utility class for formatting currency, dates, numbers and text display values.
class Formatters {
  Formatters._();

  /// Formats amount to currency string (e.g. $1,250.00).
  static String formatCurrency(double amount, {String symbol = r'$'}) {
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  /// Compact number formatter (e.g. 1.2K, 3.4M).
  static String compactNumber(num number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
}
