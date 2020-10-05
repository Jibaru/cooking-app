extension NumberCheck on num {
  bool hasDecimals() => this - this.toInt() != 0;

  bool hasNotDecimals() => this - this.toInt() == 0;
}
