class BankCell {
  BankCell({
    required this.count,
    required this.denomination,
  });

  int count;
  final int denomination;

  @override
  String toString() => '$count X $denomination ₽';
}
