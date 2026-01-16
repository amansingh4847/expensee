import 'package:isar/isar.dart';

part 'expense.g.dart';

@Collection()
class Expense {
  Id id =  Isar.autoIncrement;
  final String name;
  final String amount;
  final DateTime date;

  Expense({
    required this.name,
    required this.amount,
    required this.date,
  });

}