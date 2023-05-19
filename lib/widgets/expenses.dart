import 'package:expense_tracker_app_flutter/widgets/chart/chart.dart';
import 'package:expense_tracker_app_flutter/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker_app_flutter/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

class Expense extends StatefulWidget {
  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  final List<Expenses> _registerExpense = [
    Expenses(
        title: "flutter course",
        amount: 500,
        date: DateTime.now(),
        category: Category.work),
    Expenses(
        title: "cinema",
        amount: 700,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: addExpense));
  }

  void addExpense(Expenses expense) {
    setState(() {
      _registerExpense.add(expense);
    });
  }

  void _removeExpense(Expenses expense) {
    final expenseIndex = _registerExpense.indexOf(expense);
    setState(() {
      _registerExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Expense Deleted"),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registerExpense.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    Widget maincontent = Center(
      child: Text("No expense found "),
    );
    if (_registerExpense.isNotEmpty) {
      maincontent = ExpenseList(
        expenses: _registerExpense,
        onRemoveExpenses: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                _openAddExpense();
                //todo
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: width <600 ? Column(
        children: [
          Chart(expenses: _registerExpense),
          Expanded(child: maincontent)],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _registerExpense)),
          Expanded(child: maincontent)
        ],
      ),
    );
  }
}
