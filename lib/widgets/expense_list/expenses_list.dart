import 'package:flutter/cupertino.dart';

import '../../models/expenses.dart';
import 'expenses_item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses});

  final List<Expenses> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}
