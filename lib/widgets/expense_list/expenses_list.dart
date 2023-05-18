import 'package:flutter/cupertino.dart';

import '../../models/expenses.dart';
import 'expenses_item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpenses});

  final List<Expenses> expenses;
  final void Function(Expenses expense) onRemoveExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpenses(expenses[index]);
          },
          child: ExpenseItem(expenses[index])),
    );
  }
}
