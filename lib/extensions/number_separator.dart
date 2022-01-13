extension NumberSeparator on double {
  static RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String toStringWithSeparators() {
    // var f = NumberFormats
    return toStringAsFixed(0).replaceAllMapped(reg, (Match m) => '${m[1]},');
  }
}
